import 'package:uuid/uuid.dart';
import '../payload/websocket_payload.dart';
import '../types.dart';
import 'base_broadcast.dart';
import 'types.dart';

class BroadcastManager {
  final _uuid = const Uuid();
  final IWebSocket _websocket;

  final Map<String, BaseBroadcast> broadcasts = {};
  final Map<String, BroadcastInternalOnCreatedFn> _createdInternalListeners = {};
  final Map<String, BroadcastJoinedFn> _waitingForJoin = {};

  OnCreateBroadcastFn? onCreateBroadcast;

  final List<OnIncomingMessageFn> _incomingMessageListeners = [];
  final List<OnSelfJoinedFn> _selfJoinedListeners = [];
  final List<OnSelfLeavedFn> _selfLeavedListeners = [];
  final List<OnSelfUpdateFn> _selfUpdateListeners = [];
  final List<OnClientJoinedFn> _clientJoinedListeners = [];
  final List<OnClientLeavedFn> _clientLeavedListeners = [];
  final List<OnCreatedFn> _createdListeners = [];
  final List<OnRemovedFn> _removedListeners = [];
  final List<OnDestroyFn> _destroyListeners = [];

  BroadcastManager(this._websocket);

  BaseBroadcast? get(String name) {
    return broadcasts[name];
  }

  T? getAs<T extends BaseBroadcast>(String name) {
    final b = broadcasts[name];
    if (b is T) return b;
    return null;
  }

  int total() => broadcasts.length;
  bool isEmpty() => broadcasts.isEmpty;
  List<BaseBroadcast> toArray() => broadcasts.values.toList();
  List<String> names() => broadcasts.keys.toList();
  List<String> ids() => broadcasts.values.map((b) => b.getId()).toList();

  void onIncomingMessage(OnIncomingMessageFn fn) => _incomingMessageListeners.add(fn);
  void onSelfJoined(OnSelfJoinedFn fn) => _selfJoinedListeners.add(fn);
  void onSelfLeaved(OnSelfLeavedFn fn) => _selfLeavedListeners.add(fn);
  void onSelfUpdate(OnSelfUpdateFn fn) => _selfUpdateListeners.add(fn);
  void onClientJoined(OnClientJoinedFn fn) => _clientJoinedListeners.add(fn);
  void onClientLeaved(OnClientLeavedFn fn) => _clientLeavedListeners.add(fn);
  void onCreated(OnCreatedFn fn) => _createdListeners.add(fn);
  void onRemoved(OnRemovedFn fn) => _removedListeners.add(fn);
  void onDestroy(OnDestroyFn fn) => _destroyListeners.add(fn);

  void create(
    String name, [
    BroadcastCreateOptions options = const BroadcastCreateOptions(),
  ]) {
    final tag = _uuid.v4().replaceAll('-', '');
    if (options.onCreated != null) {
      _createdInternalListeners[tag] = options.onCreated!;
    }

    WebSocketPayload(_websocket)
        .controller('broadcast')
        .action('create', data: {
          'name': name,
          'tag': tag,
          if (options.alias != null) 'alias': options.alias,
          if (options.maxClients != null) 'maxClients': options.maxClients,
          if (options.protected != null) 'protected': options.protected,
          if (options.data != null) 'data': options.data,
          if (options.state != null) 'state': options.state,
          if (options.join != null) 'join': options.join,
          if (options.autoJoin != null) 'autoJoin': options.autoJoin,
          if (options.validateToken != null)
            'validateToken': options.validateToken,
          if (options.custom != null) 'custom': options.custom,
        })
        .send();
  }

  void join(String name, [dynamic meta]) {
    WebSocketPayload(_websocket)
        .controller('broadcast')
        .action('join', data: {
          'name': name,
          'meta': ?meta,
        })
        .send();
  }

  void promisedJoin(String name, dynamic meta, BroadcastJoinedFn joined) {
    _waitingForJoin[name] = joined;
    join(name, meta);
  }

  void leave(String name) {
    WebSocketPayload(_websocket)
        .controller('broadcast')
        .action('leave', data: {'name': name})
        .send();
  }

  void setData(String name, dynamic data) {
    WebSocketPayload(_websocket)
        .controller('broadcast')
        .action('data-set', data: {
          'data': data,
          'name': name,
        })
        .send();
  }

  void updateData(String name, dynamic data) {
    WebSocketPayload(_websocket)
        .controller('broadcast')
        .action('data-update', data: {
          'data': data,
          'name': name,
        })
        .send();
  }

  void destroy(String name) {
    WebSocketPayload(_websocket)
        .controller('broadcast')
        .action('destroy', data: {'name': name})
        .send();
  }

  void loadMetaByName(String name, void Function(BroadcastMeta meta) loaded) {
    WebSocketPayload(_websocket)
        .controller('broadcast')
        .action(
          'load-meta-by-name',
          data: {'name': name},
          onResponse: (result, info) {
            if (!info.executed || !result.success || result.data == null) {
              return;
            }
            if (result.data is Map<String, dynamic>) {
              loaded(BroadcastMeta.fromJson(result.data as Map<String, dynamic>));
            }
          },
        )
        .send();
  }

  BaseBroadcast createBroadcast(CreatedData data) {
    BaseBroadcast broadcast;
    if (onCreateBroadcast != null) {
      final custom = onCreateBroadcast!(data);
      if (custom is BaseBroadcast) {
        broadcast = custom;
      } else {
        broadcast = BaseBroadcast();
      }
    } else {
      broadcast = BaseBroadcast();
    }

    broadcast.boot(data, _websocket);
    broadcast.build();
    broadcasts[data.name] = broadcast;

    final onCreated = _createdInternalListeners.remove(data.tag);
    onCreated?.call(broadcast);

    return broadcast;
  }

  void dispatch(String name, String action, Map<String, dynamic> message) {
    for (final fn in List<OnIncomingMessageFn>.from(_incomingMessageListeners)) {
      fn({
        'data': message,
        'broadcast': name,
        'action': action,
        'client': _websocket,
      });
    }

    final rawData = (message['data'] as Map<String, dynamic>?) ?? {};

    switch (action) {
      case 'selfJoined':
        final data = SelfJoinedData.fromJson(rawData);
        for (final fn in List<OnSelfJoinedFn>.from(_selfJoinedListeners)) {
          fn(data);
        }
        final broadcast = createBroadcast(CreatedData(
          id: data.id,
          name: data.name,
          data: data.data,
          meta: data.meta,
          state: data.state,
          alias: data.meta.alias,
          tag: data.meta.tag,
        ));
        broadcast.selfJoined(data);
        final waiter = _waitingForJoin.remove(data.name);
        waiter?.call(broadcast);
        break;

      case 'selfLeaved':
        final data = SelfLeavedData.fromJson(rawData);
        for (final fn in List<OnSelfLeavedFn>.from(_selfLeavedListeners)) {
          fn(data);
        }
        broadcasts.remove(data.name);
        break;

      case 'created':
        final data = CreatedData.fromJson(rawData);
        for (final fn in List<OnCreatedFn>.from(_createdListeners)) {
          fn(data);
        }
        createBroadcast(data);
        break;

      case 'destroy':
        for (final fn in List<OnDestroyFn>.from(_destroyListeners)) {
          fn(rawData);
        }
        break;

      case 'removed':
        for (final fn in List<OnRemovedFn>.from(_removedListeners)) {
          fn(rawData);
        }
        final removedName = rawData['name']?.toString() ?? name;
        broadcasts.remove(removedName);
        break;

      case 'selfUpdate':
        final data = SelfUpdateData.fromJson(rawData);
        for (final fn in List<OnSelfUpdateFn>.from(_selfUpdateListeners)) {
          fn(data);
        }
        final b = get(data.name);
        b?.update(data);
        break;

      case 'clientJoined':
        final data = ClientJoinedData.fromJson(rawData);
        for (final fn in List<OnClientJoinedFn>.from(_clientJoinedListeners)) {
          fn(data);
        }
        final b = get(data.name);
        b?.joined(data);
        break;

      case 'clientLeaved':
        final data = ClientLeavedData.fromJson(rawData);
        for (final fn in List<OnClientLeavedFn>.from(_clientLeavedListeners)) {
          fn(data);
        }
        final b = get(data.name);
        b?.leaved(data);
        break;

      case 'emit':
        final data = EmitData.fromJson(rawData);
        final b = get(data.name);
        b?.executeEmit(data);
        break;
    }
  }
}

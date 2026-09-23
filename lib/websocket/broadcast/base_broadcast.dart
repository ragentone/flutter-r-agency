import 'package:event_bus/event_bus.dart';
import 'package:uuid/uuid.dart';
import '../payload/websocket_payload.dart';
import '../types.dart';
import 'types.dart';

class BaseBroadcast<Data, State> {
  final _uuid = const Uuid();
  final EventBus events = EventBus();
  BroadcastModel? model;
  IWebSocket? _websocket;
  bool _ready = false;
  final Map<String, BroadcastCallbackFn<dynamic>> _callbacks = {};

  BroadcastModel createModel(CreatedData data) {
    return BroadcastModel(
      data: Map<String, dynamic>.from(data.data),
      meta: data.meta,
      state: Map<String, dynamic>.from(data.state),
      clients: {},
      self: null,
      id: data.id,
      name: data.name,
      logs: [],
    );
  }

  BroadcastClientData? getSelf() {
    return model?.self;
  }

  Map<String, dynamic>? getSelfMeta() {
    return model?.self?.meta;
  }

  String getId() {
    return model?.id ?? '';
  }

  String getName() {
    return model?.name ?? '';
  }

  void execute<D>([String action = '', D? data]) {
    if (_websocket == null) return;
    WebSocketPayload(_websocket!)
        .controller('broadcast')
        .action('execute', data: {
          'data': data,
          'action': action,
          'name': getName(),
        })
        .send();
  }

  void executeCB<D, Res>(
    String action,
    BroadcastCallbackFn<Res> callback, [
    D? data,
  ]) {
    if (_websocket == null) return;
    final id = _uuid.v4().replaceAll('-', '');
    _callbacks[id] = (res) => callback(res as Res);

    WebSocketPayload(_websocket!)
        .controller('broadcast')
        .action('execute', data: {
          'data': data,
          'action': action,
          'name': getName(),
          'requestId': id,
        })
        .send();
  }

  void updateData<D>(D data, [void Function()? success]) {
    if (_websocket == null) return;
    WebSocketPayload(_websocket!)
        .controller('broadcast')
        .action(
          'data-update',
          data: {
            'data': data,
            'name': getName(),
          },
          onResponse: (result, info) {
            if (!info.executed || !result.success || success == null) {
              return;
            }
            success();
          },
        )
        .send();
  }

  void updateState<S>(S state, [void Function()? success]) {
    if (_websocket == null) return;
    WebSocketPayload(_websocket!)
        .controller('broadcast')
        .action(
          'state-update',
          data: {
            'state': state,
            'name': getName(),
          },
          onResponse: (result, info) {
            if (!info.executed || !result.success || success == null) {
              return;
            }
            success();
          },
        )
        .send();
  }

  void emit(String event, [Map<String, dynamic>? payload]) {
    if (_websocket == null || model == null) return;
    WebSocketPayload(_websocket!)
        .controller('broadcast')
        .action('emit', data: {
          'emit': {
            'event': event,
            'payload': ?payload,
          },
          'id': getId(),
          'name': getName(),
        })
        .send();
  }

  bool isEmpty() {
    return (model?.clients.isEmpty) ?? true;
  }

  void build() {
    if (_ready) return;

    events.on<Map<String, dynamic>>().listen((event) {
      final type = event['__type'] as String?;
      if (type == '__bc_internal::incoming_log' && model != null) {
        model!.logs.add(BroadcastLog.fromJson(event['log'] as Map<String, dynamic>));
      } else if (type == '__bc_internal::clear_logs' && model != null) {
        model!.logs.clear();
      } else if (type == '__bc_internal::update_state' && model != null) {
        model!.state = Map<String, dynamic>.from(event['state'] as Map);
      } else if (type == '__bc_internal::update_state_part' && model != null) {
        model!.state[event['key'].toString()] = event['value'];
      } else if (type == '__bc_internal::update_data_part' && model != null) {
        model!.data[event['key'].toString()] = event['value'];
      } else if (type == '__bc_internal::controller_action_executed') {
        final id = event['requestId'] as String?;
        if (id != null) {
          final cb = _callbacks.remove(id);
          cb?.call(event['data']);
        }
      }
    });

    _ready = true;
  }

  List<BroadcastLog> logs() {
    return model?.logs ?? [];
  }

  void clearLogs() {
    model?.logs.clear();
  }

  BroadcastClientData? getClient(String deviceId) {
    return model?.clients[deviceId];
  }

  List<BroadcastClientData> clients() {
    if (model == null) return [];
    return parseClients(model!.clients.values.toList());
  }

  void boot(CreatedData data, IWebSocket websocket) {
    _websocket = websocket;
    model = createModel(data);
    initialize();
  }

  dynamic getData() {
    return model?.data;
  }

  dynamic getState() {
    return model?.state;
  }

  BroadcastMeta? getMeta() {
    return model?.meta;
  }

  void joined(ClientJoinedData data) {
    if (model == null) return;
    final client = createClientData(data.client);
    model!.clients[data.client.deviceId] = client;
    model!.meta.clients[data.client.deviceId] = client;
    model!.meta.clientsTotal = model!.clients.length;
    changed();
    events.fire({
      'event': 'client::joined',
      'client': client,
      'total': model!.clients.length,
    });
    afterClientJoined(client);
  }

  void leaved(ClientLeavedData data) {
    if (model == null) return;
    final client = model!.clients[data.client.deviceId];
    if (client == null) return;

    model!.clients.remove(data.client.deviceId);
    model!.meta.clients.remove(data.client.deviceId);
    model!.meta.clientsTotal = model!.clients.length;
    changed();
    events.fire({
      'event': 'client::leaved',
      'client': client,
      'total': model!.clients.length,
    });
    afterClientLeaved(data.client);
  }

  void selfJoined(SelfJoinedData data) {
    if (model == null) return;
    model!.self = createSelf(data.self);
    update(SelfUpdateData(
      id: data.id,
      name: data.name,
      data: data.data,
      meta: data.meta.toJson(),
      state: data.state,
    ));
    changed();
    afterSelfJoined(model!.self!);
  }

  void update(SelfUpdateData data) {
    if (model == null) return;
    model!.meta = BroadcastMeta.fromJson(
      deepMerge(model!.meta.toJson(), data.meta),
    );
    model!.data = deepMerge(model!.data, data.data);
    model!.state = deepMerge(model!.state, data.state);

    for (final clientData in model!.meta.clients.values) {
      model!.clients[clientData.deviceId] = createClientData(clientData);
    }
    changed();
  }

  void executeEmit(EmitData data) {
    final payload = Map<String, dynamic>.from(data.emit['payload'] as Map? ?? {});
    payload['meta'] = {
      'id': getId(),
      'name': getName(),
    };
    final eventName = data.emit['event']?.toString() ?? '';
    events.fire({
      'event': eventName,
      'payload': payload,
    });
  }

  void kickClient(String clientId) {
    if (_websocket == null) return;
    WebSocketPayload(_websocket!)
        .controller('broadcast')
        .action('client-kick', data: {
          'clientId': clientId,
          'name': getName(),
        })
        .send();
  }

  void changed() {
    if (model == null) return;
    onChange(model!);
  }

  List<BroadcastClientData> parseClients(List<BroadcastClientData> clients) {
    return clients;
  }

  BroadcastClientData createClientData(BroadcastClientData data) {
    return data;
  }

  BroadcastClientData createSelf(BroadcastClientData data) {
    return data;
  }

  void onChange(BroadcastModel model) {}

  void afterClientJoined(BroadcastClientData client) {}

  void afterClientLeaved(BroadcastClientData client) {}

  void afterSelfJoined(BroadcastClientData client) {}

  void initialize() {}
}

import 'package:uuid/uuid.dart';

typedef VoidCallback = void Function();
typedef WsChannelEventFn = void Function(WsChannelEventArgs args);
typedef WsChannelOnNotifyFn = void Function(dynamic notify);
typedef WsChannelOnGlobalFn = void Function(Map<String, dynamic> message);

class WsChannelEventArgs {
  final Map<String, dynamic> payload;
  final Map<String, dynamic> message;
  final int index;

  WsChannelEventArgs({
    required this.payload,
    required this.message,
    required this.index,
  });
}

class WsChannelEventOptions {
  final bool once;
  final int sortOrder;

  const WsChannelEventOptions({
    this.once = false,
    this.sortOrder = 0,
  });
}

class _WsChannelStoredEvent {
  final String id;
  final WsChannelEventFn fn;
  final WsChannelEventOptions options;
  final String event;

  _WsChannelStoredEvent({
    required this.id,
    required this.fn,
    required this.options,
    required this.event,
  });
}

abstract class IWebSocketChannel {
  String get name;
  VoidCallback on(
    String event,
    WsChannelEventFn fn, [
    WsChannelEventOptions options = const WsChannelEventOptions(),
  ]);
  void onNotify(WsChannelOnNotifyFn fn);
  void onGlobal(WsChannelOnGlobalFn fn);
  void destroy();
}

class WebSocketChannel implements IWebSocketChannel {
  final _uuid = const Uuid();
  @override
  final String name;
  final void Function(String name) _onDestroy;

  final Map<String, Map<String, _WsChannelStoredEvent>> _events = {};
  final List<WsChannelOnNotifyFn> _onNotify = [];
  final List<WsChannelOnGlobalFn> _onGlobal = [];

  WebSocketChannel({
    required this.name,
    required void Function(String name) onDestroy,
  }) : _onDestroy = onDestroy; // ignore: prefer_initializing_formals

  @override
  void onNotify(WsChannelOnNotifyFn fn) {
    _onNotify.add(fn);
  }

  @override
  void onGlobal(WsChannelOnGlobalFn fn) {
    _onGlobal.add(fn);
  }

  @override
  VoidCallback on(
    String event,
    WsChannelEventFn fn, [
    WsChannelEventOptions options = const WsChannelEventOptions(),
  ]) {
    _events.putIfAbsent(event, () => {});
    final id = _uuid.v4().substring(0, 8);

    _events[event]![id] = _WsChannelStoredEvent(
      id: id,
      fn: fn,
      options: options,
      event: event,
    );

    return () {
      off(event, id);
    };
  }

  void off(String event, String id) {
    _events[event]?.remove(id);
  }

  void dispatch(Map<String, dynamic> message) {
    for (final fn in List<WsChannelOnGlobalFn>.from(_onGlobal)) {
      fn(message);
    }

    if (message['emits'] != null && message['emits'] is List) {
      final emits = message['emits'] as List;
      for (final emit in emits) {
        if (emit is Map<String, dynamic>) {
          _call(emit, message);
        }
      }
    }

    if (message['notify'] != null && _onNotify.isNotEmpty) {
      final notifyList = message['notify'];
      if (notifyList is List) {
        for (final item in notifyList) {
          for (final fn in List<WsChannelOnNotifyFn>.from(_onNotify)) {
            fn(item);
          }
        }
      } else {
        for (final fn in List<WsChannelOnNotifyFn>.from(_onNotify)) {
          fn(notifyList);
        }
      }
    }
  }

  void _call(Map<String, dynamic> emit, Map<String, dynamic> message) {
    final eventName = emit['event']?.toString() ?? '';
    final events = _getEvents(eventName);

    for (var i = 0; i < events.length; i++) {
      final stored = events[i];
      stored.fn(WsChannelEventArgs(
        payload: (emit['payload'] as Map<String, dynamic>?) ?? {},
        message: message,
        index: i,
      ));

      if (stored.options.once) {
        off(stored.event, stored.id);
      }
    }
  }

  List<_WsChannelStoredEvent> _getEvents(String event) {
    final map = _events[event];
    if (map == null) return [];
    final list = map.values.toList();
    list.sort((a, b) => a.options.sortOrder.compareTo(b.options.sortOrder));
    return list;
  }

  @override
  void destroy() {
    _onDestroy(name);
  }
}

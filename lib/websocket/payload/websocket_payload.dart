import '../controller/websocket_controller.dart';
import '../types.dart';

class WebSocketPayload {
  final IWebSocket _websocket;
  final List<Map<String, dynamic>> _emits = [];
  final List<WebSocketController> _controllers = [];
  String? _command;
  dynamic _payload;
  dynamic _data;
  WsCallbackFn? _callback;

  WebSocketPayload(this._websocket);

  WebSocketPayload emit(String event, [dynamic payload]) {
    _emits.add({
      'event': event,
      'payload': payload,
    });
    return this;
  }

  WebSocketPayload command(String cmd, [dynamic payload = const {}]) {
    _command = cmd;
    _payload = payload;
    return this;
  }

  WebSocketPayload setData(dynamic data) {
    _data = data;
    return this;
  }

  WebSocketPayload callback(WsCallbackFn callback) {
    _callback = callback;
    return this;
  }

  WebSocketController controller(String name) {
    final ctrl = WebSocketController(name, send);
    _controllers.add(ctrl);
    return ctrl;
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (_emits.isNotEmpty) {
      map['emits'] = _emits;
    }
    if (_command != null) {
      map['command'] = _command;
      if (_payload != null) {
        map['payload'] = _payload;
      }
    } else if (_payload != null) {
      map['payload'] = _payload;
    }
    if (_data != null) {
      map['data'] = _data;
    }
    if (_controllers.isNotEmpty) {
      map['controller'] = _controllers.map((c) => c.export()).toList();
    }
    if (_callback != null) {
      map['callbackFn'] = _callback;
    }
    return map;
  }

  void send() {
    _websocket.send(toMap());
  }
}

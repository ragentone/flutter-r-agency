import 'package:uuid/uuid.dart';
import '../types.dart';

class WebSocketCallback {
  final _uuid = const Uuid();
  final Map<String, WsCallbackFn> _callbacks = {};

  void clear() {
    _callbacks.clear();
  }

  String set(WsCallbackFn fn) {
    final id = _uuid.v4().replaceAll('-', '');
    _callbacks[id] = fn;
    return id;
  }

  WsCallbackFn? get(String id) {
    final fn = _callbacks[id];
    if (fn == null) return null;
    _callbacks.remove(id);
    return fn;
  }
}

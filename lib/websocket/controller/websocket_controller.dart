import 'package:uuid/uuid.dart';
import '../types.dart';

abstract class IWsCTRLInternal {
  void send();
}

class WsCTRLInternalImpl implements IWsCTRLInternal {
  final void Function() _onSend;
  WsCTRLInternalImpl(this._onSend);

  @override
  void send() => _onSend();
}

class WebSocketController {
  final _uuid = const Uuid();
  final String _name;
  final IWsCTRLInternal _internal;

  String? _action;
  dynamic _data;
  WsCTRLResponseFn? _onResponse;

  WebSocketController(this._name, void Function() onSend)
      : _internal = WsCTRLInternalImpl(onSend);

  IWsCTRLInternal action(
    String action, {
    dynamic data,
    WsCTRLResponseFn? onResponse,
  }) {
    _action = action;
    _data = data;
    _onResponse = onResponse;
    return _internal;
  }

  WsSenderCTRL export() {
    return WsSenderCTRL(
      key: '$_name::$_action',
      data: _data,
      id: _createId(),
      response: _onResponse != null,
      responseFn: _onResponse,
    );
  }

  String _createId() {
    final raw = _uuid.v4().replaceAll('-', '');
    return [
      raw.substring(0, 4),
      raw.substring(4, 12),
      raw.substring(12, 20),
      raw.substring(20, 28),
      raw.substring(28, 32),
    ].join('-');
  }
}

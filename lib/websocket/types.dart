
typedef WsBeforeSendFn = void Function(Map<String, dynamic> payload);
typedef WsModifyPayloadFn = Map<String, dynamic> Function(Map<String, dynamic> payload);
typedef WebsocketConnectedFn = void Function(bool success);
typedef WsCallbackFn = void Function(Map<String, dynamic> data);

class WebSocketState {
  bool connected;
  WebSocketState({this.connected = false});

  Map<String, dynamic> toJson() => {'connected': connected};
}

typedef IWebSocketState = WebSocketState;

class WsClientLog {
  final String message;
  final String type; // 'info' | 'warn' | 'error' | 'success'
  final Map<String, dynamic> payload;
  final String? key;
  final String dateTime;

  WsClientLog({
    required this.message,
    this.type = 'info',
    this.payload = const {},
    this.key,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
    'message': message,
    'type': type,
    'payload': payload,
    if (key != null) 'key': key,
    'dateTime': dateTime,
  };
}

typedef IWsClientLog = WsClientLog;

class WsCTRLInfo {
  final String? hrtime;
  final List<dynamic>? errors;
  final bool executed;

  WsCTRLInfo({
    this.hrtime,
    this.errors,
    this.executed = false,
  });

  factory WsCTRLInfo.fromJson(Map<String, dynamic> json) {
    return WsCTRLInfo(
      hrtime: json['hrtime'] as String?,
      errors: json['errors'] as List<dynamic>?,
      executed: json['executed'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    if (hrtime != null) 'hrtime': hrtime,
    if (errors != null) 'errors': errors,
    'executed': executed,
  };
}

typedef IWsCTRLInfo = WsCTRLInfo;

class WsCTRLResult<T> {
  final bool success;
  final T? data;
  final Map<String, dynamic> raw;

  WsCTRLResult({
    required this.success,
    this.data,
    this.raw = const {},
  });

  factory WsCTRLResult.fromJson(Map<String, dynamic> json) {
    return WsCTRLResult(
      success: json['success'] as bool? ?? false,
      data: json['data'] as T?,
      raw: json,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    if (data != null) 'data': data,
    ...raw,
  };
}

typedef IWsCTRLResult<T> = WsCTRLResult<T>;

typedef WsCTRLResponseFn<Res> = void Function(
  WsCTRLResult<Res> result,
  WsCTRLInfo info,
);

class WsSenderCTRL {
  final String key;
  final dynamic data;
  final String id;
  final bool response;
  final WsCTRLResponseFn? responseFn;

  WsSenderCTRL({
    required this.key,
    this.data,
    required this.id,
    required this.response,
    this.responseFn,
  });

  Map<String, dynamic> toJson() => {
    'key': key,
    if (data != null) 'data': data,
    'id': id,
    'response': response,
  };
}

typedef IWsSenderCTRL = WsSenderCTRL;

abstract class IWebSocket {
  String getToken();
  void send(Map<String, dynamic> payload);
  void emit(String event, [dynamic payload]);
  void command(String cmd, [dynamic payload]);
  void disconnect();
}

import '../types.dart';

class WsEmit {
  final String event;
  final Map<String, dynamic> payload;

  WsEmit({
    required this.event,
    this.payload = const {},
  });

  factory WsEmit.fromJson(Map<String, dynamic> json) {
    return WsEmit(
      event: json['event']?.toString() ?? '',
      payload: json['payload'] is Map
          ? Map<String, dynamic>.from(json['payload'] as Map)
          : const {},
    );
  }

  Map<String, dynamic> toJson() => {
        'event': event,
        'payload': payload,
      };
}

typedef IWsEmit = WsEmit;

class WsNotify {
  final String? type; // 'success' | 'info' | 'warning' | 'error'
  final String? title;
  final String message;
  final Map<String, dynamic> payload;
  final String? translateKey;
  final int? code;
  final int? duration;

  WsNotify({
    this.type,
    this.title,
    required this.message,
    this.payload = const {},
    this.translateKey,
    this.code,
    this.duration,
  });

  factory WsNotify.fromJson(Map<String, dynamic> json) {
    return WsNotify(
      type: json['type']?.toString(),
      title: json['title']?.toString(),
      message: json['message']?.toString() ?? '',
      payload: json['payload'] is Map
          ? Map<String, dynamic>.from(json['payload'] as Map)
          : const {},
      translateKey: json['translateKey']?.toString(),
      code: json['code'] is num
          ? (json['code'] as num).toInt()
          : int.tryParse(json['code']?.toString() ?? ''),
      duration: json['duration'] is num
          ? (json['duration'] as num).toInt()
          : int.tryParse(json['duration']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        if (title != null) 'title': title,
        'message': message,
        'payload': payload,
        if (translateKey != null) 'translateKey': translateKey,
        if (code != null) 'code': code,
        if (duration != null) 'duration': duration,
      };
}

typedef INotify = WsNotify;

class MeshError {
  final int code;
  final String message;
  final String name;
  final String? translateKey;
  final Map<String, dynamic> payload;

  MeshError({
    required this.code,
    required this.message,
    required this.name,
    this.translateKey,
    this.payload = const {},
  });

  factory MeshError.fromJson(Map<String, dynamic> json) {
    return MeshError(
      code: json['code'] is num
          ? (json['code'] as num).toInt()
          : int.tryParse(json['code']?.toString() ?? '') ?? 0,
      message: json['message']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      translateKey: json['translateKey']?.toString(),
      payload: json['payload'] is Map
          ? Map<String, dynamic>.from(json['payload'] as Map)
          : const {},
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'name': name,
        if (translateKey != null) 'translateKey': translateKey,
        'payload': payload,
      };
}

typedef IMeshError = MeshError;

class WsReceivedCTRL {
  final String id;
  final WsCTRLResult<dynamic> result;
  final WsCTRLInfo info;

  WsReceivedCTRL({
    required this.id,
    required this.result,
    required this.info,
  });

  factory WsReceivedCTRL.fromJson(Map<String, dynamic> json) {
    return WsReceivedCTRL(
      id: json['id']?.toString() ?? '',
      result: WsCTRLResult<dynamic>.fromJson(
        json['result'] is Map
            ? Map<String, dynamic>.from(json['result'] as Map)
            : const {},
      ),
      info: WsCTRLInfo.fromJson(
        json['info'] is Map
            ? Map<String, dynamic>.from(json['info'] as Map)
            : const {},
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'result': result.toJson(),
        'info': info.toJson(),
      };
}

typedef IWsReceivedCTRL = WsReceivedCTRL;

class WsIncomingMessage {
  final bool? ping;
  final bool? pong;
  final List<WsEmit>? emits;
  final List<WsNotify>? notify;
  final Map<String, dynamic>? data;
  final WsReceivedCTRL? controller;
  final String? broadcast;
  final dynamic action;
  final String? code;
  final String? callbackId;
  final List<MeshError>? exceptions;
  final String? channel;
  final String? requestId;
  final Map<String, dynamic> raw;

  WsIncomingMessage({
    this.ping,
    this.pong,
    this.emits,
    this.notify,
    this.data,
    this.controller,
    this.broadcast,
    this.action,
    this.code,
    this.callbackId,
    this.exceptions,
    this.channel,
    this.requestId,
    this.raw = const {},
  });

  factory WsIncomingMessage.fromJson(Map<String, dynamic> json) {
    List<WsEmit>? parsedEmits;
    if (json['emits'] is List) {
      parsedEmits = (json['emits'] as List)
          .whereType<Map>()
          .map((e) => WsEmit.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    List<WsNotify>? parsedNotify;
    if (json['notify'] is List) {
      parsedNotify = (json['notify'] as List)
          .whereType<Map>()
          .map((e) => WsNotify.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } else if (json['notify'] is Map) {
      parsedNotify = [
        WsNotify.fromJson(Map<String, dynamic>.from(json['notify'] as Map))
      ];
    }

    List<MeshError>? parsedExceptions;
    if (json['exceptions'] is List) {
      parsedExceptions = (json['exceptions'] as List)
          .whereType<Map>()
          .map((e) => MeshError.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    WsReceivedCTRL? parsedController;
    if (json['controller'] is Map) {
      parsedController = WsReceivedCTRL.fromJson(
        Map<String, dynamic>.from(json['controller'] as Map),
      );
    }

    return WsIncomingMessage(
      ping: json['ping'] as bool?,
      pong: json['pong'] as bool?,
      emits: parsedEmits,
      notify: parsedNotify,
      data: json['data'] is Map
          ? Map<String, dynamic>.from(json['data'] as Map)
          : null,
      controller: parsedController,
      broadcast: json['broadcast']?.toString(),
      action: json['action'],
      code: json['code']?.toString(),
      callbackId: json['callbackId']?.toString(),
      exceptions: parsedExceptions,
      channel: json['channel']?.toString(),
      requestId: json['requestId']?.toString(),
      raw: json,
    );
  }

  bool get isPing => ping == true;
  bool get isPong => pong == true;
  bool get hasChannel => channel != null && channel!.isNotEmpty;
  bool get hasBroadcast => broadcast != null && action != null;
  bool get hasEmits => emits != null && emits!.isNotEmpty;
  bool get hasController => controller != null;
  bool get hasCallback => callbackId != null && callbackId!.isNotEmpty;
  bool get hasNotify => notify != null && notify!.isNotEmpty;
  bool get hasExceptions => exceptions != null && exceptions!.isNotEmpty;

  Map<String, dynamic> toJson() => {
        if (ping != null) 'ping': ping,
        if (pong != null) 'pong': pong,
        if (emits != null) 'emits': emits!.map((e) => e.toJson()).toList(),
        if (notify != null) 'notify': notify!.map((n) => n.toJson()).toList(),
        if (data != null) 'data': data,
        if (controller != null) 'controller': controller!.toJson(),
        if (broadcast != null) 'broadcast': broadcast,
        if (action != null) 'action': action,
        if (code != null) 'code': code,
        if (callbackId != null) 'callbackId': callbackId,
        if (exceptions != null)
          'exceptions': exceptions!.map((e) => e.toJson()).toList(),
        if (channel != null) 'channel': channel,
        if (requestId != null) 'requestId': requestId,
        ...raw,
      };
}

typedef WsIncomingData = WsIncomingMessage;
typedef IMeshClientMessage = WsIncomingMessage;
typedef MeshClientMessage = WsIncomingMessage;

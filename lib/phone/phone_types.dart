enum PhoneCallType { audio, video }

extension PhoneCallTypeWire on PhoneCallType {
  String get wire => this == PhoneCallType.video ? 'video' : 'audio';

  static PhoneCallType fromWire(String? value) {
    return value == 'video' ? PhoneCallType.video : PhoneCallType.audio;
  }
}

enum PhoneCallStatus { idle, calling, ringing, inCall }

class PhoneIncomingCall {
  final String callId;
  final String fromUserId;
  final String fromDeviceId;
  final String fromCode;
  final String? fromAlias;
  final String? fromAvatarUrl;
  final PhoneCallType callType;

  PhoneIncomingCall({
    required this.callId,
    required this.fromUserId,
    required this.fromDeviceId,
    required this.fromCode,
    this.fromAlias,
    this.fromAvatarUrl,
    required this.callType,
  });

  factory PhoneIncomingCall.fromJson(Map<String, dynamic> json) {
    return PhoneIncomingCall(
      callId: json['callId']?.toString() ?? '',
      fromUserId: json['fromUserId']?.toString() ?? '',
      fromDeviceId: json['fromDeviceId']?.toString() ?? '',
      fromCode: json['fromCode']?.toString() ?? '',
      fromAlias: json['fromAlias']?.toString(),
      fromAvatarUrl: json['fromAvatarUrl']?.toString(),
      callType: PhoneCallTypeWire.fromWire(json['callType']?.toString()),
    );
  }
}

class PhoneCallAccepted {
  final String callId;
  final String peerDeviceId;

  PhoneCallAccepted({required this.callId, required this.peerDeviceId});

  factory PhoneCallAccepted.fromJson(Map<String, dynamic> json) {
    return PhoneCallAccepted(
      callId: json['callId']?.toString() ?? '',
      peerDeviceId: json['peerDeviceId']?.toString() ?? '',
    );
  }
}

class PhoneCallEnded {
  final String callId;
  final String reason;

  PhoneCallEnded({required this.callId, required this.reason});

  factory PhoneCallEnded.fromJson(Map<String, dynamic> json) {
    return PhoneCallEnded(
      callId: json['callId']?.toString() ?? '',
      reason: json['reason']?.toString() ?? 'ended',
    );
  }
}

class PhoneCallStartResult {
  final bool success;
  final String? reason;

  PhoneCallStartResult({required this.success, this.reason});
}

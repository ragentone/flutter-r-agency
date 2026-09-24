import 'package:app/phone/phone_types.dart';
import 'package:flutter/foundation.dart';

class PhoneCallSnapshot {
  final PhoneCallStatus status;
  final String? callId;
  final PhoneCallType callType;
  final String? peerUserId;
  final String? peerDeviceId;
  final String? peerCode;
  final String? peerAlias;
  final String? peerAvatarUrl;
  final bool micMuted;
  final bool cameraOff;
  final bool accepting;

  const PhoneCallSnapshot({
    this.status = PhoneCallStatus.idle,
    this.callId,
    this.callType = PhoneCallType.audio,
    this.peerUserId,
    this.peerDeviceId,
    this.peerCode,
    this.peerAlias,
    this.peerAvatarUrl,
    this.micMuted = false,
    this.cameraOff = false,
    this.accepting = false,
  });

  bool get isIdle => status == PhoneCallStatus.idle;

  String get peerDisplayName =>
      (peerAlias?.isNotEmpty ?? false) ? peerAlias! : (peerCode ?? 'Unknown');

  PhoneCallSnapshot copyWith({
    PhoneCallStatus? status,
    bool? micMuted,
    bool? cameraOff,
    bool? accepting,
  }) {
    return PhoneCallSnapshot(
      status: status ?? this.status,
      callId: callId,
      callType: callType,
      peerUserId: peerUserId,
      peerDeviceId: peerDeviceId,
      peerCode: peerCode,
      peerAlias: peerAlias,
      peerAvatarUrl: peerAvatarUrl,
      micMuted: micMuted ?? this.micMuted,
      cameraOff: cameraOff ?? this.cameraOff,
      accepting: accepting ?? this.accepting,
    );
  }
}

class PhoneState {
  static final ValueNotifier<PhoneCallSnapshot> call =
      ValueNotifier<PhoneCallSnapshot>(const PhoneCallSnapshot());
}

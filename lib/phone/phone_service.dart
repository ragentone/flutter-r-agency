import 'dart:async';

import 'package:app/config/config_response.dart';
import 'package:app/phone/phone_state.dart';
import 'package:app/phone/phone_types.dart';
import 'package:app/websocket/websocket.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

const String _wsController = 'phone_v1';

const Map<String, dynamic> _iceServersConfig = {
  'iceServers': [
    {'urls': 'stun:stun.l.google.com:19302'},
  ],
};

class PhoneService {
  static final PhoneService _instance = PhoneService._internal();

  factory PhoneService() => _instance;

  PhoneService._internal();

  Websocket? _websocket;
  RTCPeerConnection? _pc;
  MediaStream? _localStream;
  bool _renderersReady = false;
  bool _remoteDescriptionSet = false;
  final List<RTCIceCandidate> _pendingCandidates = [];

  final RTCVideoRenderer localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer remoteRenderer = RTCVideoRenderer();

  Future<void> boot(ConfigResponse config, Websocket websocket) async {
    _websocket = websocket;

    if (!_renderersReady) {
      await localRenderer.initialize();
      await remoteRenderer.initialize();
      _renderersReady = true;
    }

    websocket.events.on<Map>().listen(_onWsEvent);
  }

  void _onWsEvent(Map event) {
    final name = event['event']?.toString();
    if (name == null || !name.startsWith('phone::')) {
      return;
    }

    final rawPayload = event['payload'];
    if (rawPayload is! Map) {
      return;
    }
    final payload = Map<String, dynamic>.from(rawPayload);

    switch (name) {
      case 'phone::incoming_call':
        _handleIncomingCall(PhoneIncomingCall.fromJson(payload));
        break;
      case 'phone::call_accepted':
        _handleCallAccepted(PhoneCallAccepted.fromJson(payload));
        break;
      case 'phone::call_ended':
        _handleCallEnded(PhoneCallEnded.fromJson(payload));
        break;
      case 'phone::signal':
        _handleSignal(payload);
        break;
    }
  }

  void _handleIncomingCall(PhoneIncomingCall call) {
    if (!PhoneState.call.value.isIdle) {
      return;
    }

    PhoneState.call.value = PhoneCallSnapshot(
      status: PhoneCallStatus.ringing,
      callId: call.callId,
      callType: call.callType,
      peerUserId: call.fromUserId,
      peerDeviceId: call.fromDeviceId,
      peerCode: call.fromCode,
      peerAlias: call.fromAlias,
      peerAvatarUrl: call.fromAvatarUrl,
    );
  }

  Future<void> _handleCallAccepted(PhoneCallAccepted payload) async {
    final current = PhoneState.call.value;
    if (current.callId != payload.callId ||
        current.status != PhoneCallStatus.calling) {
      return;
    }

    try {
      final stream = await _openLocalMedia(current.callType);
      final pc = await _createPeerConnection(current.callId!);
      _pc = pc;

      for (final track in stream.getTracks()) {
        await pc.addTrack(track, stream);
      }

      final offer = await pc.createOffer();
      await pc.setLocalDescription(offer);
      _sendSignal(current.callId!, 'offer', {
        'sdp': offer.sdp,
        'type': offer.type,
      });

      PhoneState.call.value = current.copyWith(status: PhoneCallStatus.inCall);
    } catch (_) {
      end();
    }
  }

  void _handleCallEnded(PhoneCallEnded payload) {
    if (PhoneState.call.value.callId != payload.callId) {
      return;
    }
    _teardown();
  }

  Future<void> _handleSignal(Map<String, dynamic> payload) async {
    final current = PhoneState.call.value;
    if (current.callId == null || current.callId != payload['callId']) {
      return;
    }

    final signal = payload['signal'];
    if (signal is! Map) {
      return;
    }

    final kind = signal['kind']?.toString();
    final data = signal['payload'];
    if (data is! Map) {
      return;
    }
    final signalPayload = Map<String, dynamic>.from(data);

    switch (kind) {
      case 'offer':
        await _handleOffer(current, signalPayload);
        break;
      case 'answer':
        await _handleAnswer(signalPayload);
        break;
      case 'candidate':
        await _handleCandidate(signalPayload);
        break;
    }
  }

  Future<void> _handleOffer(
    PhoneCallSnapshot current,
    Map<String, dynamic> payload,
  ) async {
    if (current.callId == null) {
      return;
    }

    try {
      final stream = await _openLocalMedia(current.callType);
      final pc = await _createPeerConnection(current.callId!);
      _pc = pc;

      for (final track in stream.getTracks()) {
        await pc.addTrack(track, stream);
      }

      await pc.setRemoteDescription(
        RTCSessionDescription(payload['sdp'], payload['type']),
      );
      await _flushPendingCandidates();

      final answer = await pc.createAnswer();
      await pc.setLocalDescription(answer);
      _sendSignal(current.callId!, 'answer', {
        'sdp': answer.sdp,
        'type': answer.type,
      });

      PhoneState.call.value = current.copyWith(status: PhoneCallStatus.inCall);
    } catch (_) {
      end();
    }
  }

  Future<void> _handleAnswer(Map<String, dynamic> payload) async {
    final pc = _pc;
    if (pc == null) {
      return;
    }
    await pc.setRemoteDescription(
      RTCSessionDescription(payload['sdp'], payload['type']),
    );
    await _flushPendingCandidates();
  }

  Future<void> _handleCandidate(Map<String, dynamic> payload) async {
    final candidate = RTCIceCandidate(
      payload['candidate']?.toString(),
      payload['sdpMid']?.toString(),
      payload['sdpMLineIndex'] as int?,
    );

    if (_pc == null || !_remoteDescriptionSet) {
      _pendingCandidates.add(candidate);
      return;
    }
    await _pc!.addCandidate(candidate);
  }

  Future<void> _flushPendingCandidates() async {
    _remoteDescriptionSet = true;
    final pc = _pc;
    if (pc == null) {
      return;
    }
    for (final candidate in _pendingCandidates) {
      await pc.addCandidate(candidate);
    }
    _pendingCandidates.clear();
  }

  Future<RTCPeerConnection> _createPeerConnection(String callId) async {
    final pc = await createPeerConnection(_iceServersConfig);

    pc.onTrack = (event) {
      if (event.streams.isNotEmpty) {
        remoteRenderer.srcObject = event.streams.first;
      }
    };

    pc.onIceCandidate = (candidate) {
      if (candidate.candidate == null) {
        return;
      }
      _sendSignal(callId, 'candidate', candidate.toMap());
    };

    return pc;
  }

  void _sendSignal(String callId, String kind, Map<String, dynamic> payload) {
    _websocket!
        .payload()
        .controller(_wsController)
        .action(
          'signal',
          data: {
            'callId': callId,
            'signal': {'kind': kind, 'payload': payload},
          },
        )
        .send();
  }

  Future<MediaStream> _openLocalMedia(PhoneCallType type) async {
    final stream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': type == PhoneCallType.video ? {'facingMode': 'user'} : false,
    });
    _localStream = stream;
    localRenderer.srcObject = stream;
    return stream;
  }

  Future<String?> myCode() async {
    final completer = Completer<String?>();

    _websocket!
        .payload()
        .controller(_wsController)
        .action(
          'code',
          onResponse: (result, info) {
            final data = Map<String, dynamic>.from(result.data ?? {});
            if (!completer.isCompleted) {
              completer.complete(data['code']?.toString());
            }
          },
        )
        .send();

    return completer.future;
  }

  Future<PhoneCallStartResult> call(String code, PhoneCallType type) async {
    if (!PhoneState.call.value.isIdle) {
      return PhoneCallStartResult(success: false, reason: 'busy');
    }

    final completer = Completer<PhoneCallStartResult>();

    _websocket!
        .payload()
        .controller(_wsController)
        .action(
          'call',
          data: {'code': code, 'callType': type.wire},
          onResponse: (result, info) {
            final data = Map<String, dynamic>.from(result.data ?? {});

            if (result.success) {
              PhoneState.call.value = PhoneCallSnapshot(
                status: PhoneCallStatus.calling,
                callId: data['callId']?.toString(),
                callType: type,
                peerCode: code,
                peerDeviceId: data['peerDeviceId']?.toString(),
              );
            }

            if (!completer.isCompleted) {
              completer.complete(
                PhoneCallStartResult(
                  success: result.success,
                  reason: data['reason']?.toString(),
                ),
              );
            }
          },
        )
        .send();

    return completer.future;
  }

  void accept() {
    final current = PhoneState.call.value;
    if (current.status != PhoneCallStatus.ringing || current.callId == null) {
      return;
    }
    PhoneState.call.value = current.copyWith(accepting: true);
    _websocket!
        .payload()
        .controller(_wsController)
        .action('accept', data: {'callId': current.callId})
        .send();
  }

  void reject() {
    final current = PhoneState.call.value;
    if (current.status != PhoneCallStatus.ringing || current.callId == null) {
      return;
    }
    _websocket!
        .payload()
        .controller(_wsController)
        .action('reject', data: {'callId': current.callId})
        .send();
    _teardown();
  }

  void cancel() {
    final current = PhoneState.call.value;
    if (current.status != PhoneCallStatus.calling || current.callId == null) {
      return;
    }
    _websocket!
        .payload()
        .controller(_wsController)
        .action('cancel', data: {'callId': current.callId})
        .send();
    _teardown();
  }

  void end() {
    final current = PhoneState.call.value;
    if (current.callId == null) {
      return;
    }
    _websocket!
        .payload()
        .controller(_wsController)
        .action('end', data: {'callId': current.callId})
        .send();
    _teardown();
  }

  void toggleMic() {
    final tracks = _localStream?.getAudioTracks() ?? const [];
    if (tracks.isEmpty) {
      return;
    }
    final track = tracks.first;
    track.enabled = !track.enabled;
    PhoneState.call.value = PhoneState.call.value.copyWith(
      micMuted: !track.enabled,
    );
  }

  void toggleCamera() {
    final tracks = _localStream?.getVideoTracks() ?? const [];
    if (tracks.isEmpty) {
      return;
    }
    final track = tracks.first;
    track.enabled = !track.enabled;
    PhoneState.call.value = PhoneState.call.value.copyWith(
      cameraOff: !track.enabled,
    );
  }

  void _teardown() {
    _pendingCandidates.clear();
    _remoteDescriptionSet = false;

    final pc = _pc;
    _pc = null;
    if (pc != null) {
      pc.close();
      pc.dispose();
    }

    final stream = _localStream;
    _localStream = null;
    if (stream != null) {
      for (final track in stream.getTracks()) {
        track.stop();
      }
      stream.dispose();
    }

    localRenderer.srcObject = null;
    remoteRenderer.srcObject = null;

    PhoneState.call.value = const PhoneCallSnapshot();
  }
}

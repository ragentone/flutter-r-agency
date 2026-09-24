import 'dart:async';

import 'package:app/config/config_response.dart';
import 'package:app/phone/phone_state.dart';
import 'package:app/phone/phone_types.dart';
import 'package:app/websocket/websocket.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:peerdart/peerdart.dart';

const String _wsController = 'phone_v1';

class PhoneService {
  static final PhoneService _instance = PhoneService._internal();

  factory PhoneService() => _instance;

  PhoneService._internal();

  Websocket? _websocket;
  Peer? _peer;
  MediaConnection? _mediaConnection;
  MediaStream? _localStream;
  bool _renderersReady = false;
  String? _expectedIncomingCallId;

  final RTCVideoRenderer localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer remoteRenderer = RTCVideoRenderer();

  Future<void> boot(ConfigResponse config, Websocket websocket) async {
    _websocket = websocket;

    if (!_renderersReady) {
      await localRenderer.initialize();
      await remoteRenderer.initialize();
      _renderersReady = true;
    }

    final peerConfig = config.config.peer;
    _peer?.dispose();
    _peer = Peer(
      id: peerConfig.peerId,
      options: PeerOptions(
        host: peerConfig.host,
        port: peerConfig.port,
        path: peerConfig.path,
        secure: peerConfig.secure,
        token: peerConfig.token.deviceId,
      ),
    );

    _peer!.on<MediaConnection>('call').listen(_onIncomingMediaConnection);

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
    }
  }

  void _handleIncomingCall(PhoneIncomingCall call) {
    if (!PhoneState.call.value.isIdle) {
      return;
    }

    _expectedIncomingCallId = call.callId;
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
      final connection = _peer!.call(payload.peerDeviceId, stream);
      _mediaConnection = connection;
      _wireMediaConnection(connection);
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

  Future<void> _onIncomingMediaConnection(MediaConnection connection) async {
    final current = PhoneState.call.value;
    if (_expectedIncomingCallId == null ||
        current.status != PhoneCallStatus.ringing) {
      connection.dispose();
      return;
    }

    _mediaConnection = connection;
    _wireMediaConnection(connection);

    try {
      final stream = await _openLocalMedia(current.callType);
      connection.answer(stream);
      PhoneState.call.value = current.copyWith(status: PhoneCallStatus.inCall);
    } catch (_) {
      end();
    }
  }

  void _wireMediaConnection(MediaConnection connection) {
    connection.on<MediaStream>('stream').listen((stream) {
      remoteRenderer.srcObject = stream;
    });
    connection.on('close').listen((_) => _teardown());
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
    _expectedIncomingCallId = null;

    _mediaConnection?.dispose();
    _mediaConnection = null;

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

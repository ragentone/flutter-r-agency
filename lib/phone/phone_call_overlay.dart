import 'package:app/phone/phone_service.dart';
import 'package:app/phone/phone_state.dart';
import 'package:app/phone/phone_types.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class PhoneCallOverlay extends StatelessWidget {
  const PhoneCallOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PhoneCallSnapshot>(
      valueListenable: PhoneState.call,
      builder: (context, snapshot, _) {
        if (snapshot.isIdle) {
          return const SizedBox.shrink();
        }
        return _PhoneCallScreen(snapshot: snapshot);
      },
    );
  }
}

class _PhoneCallScreen extends StatelessWidget {
  final PhoneCallSnapshot snapshot;
  final PhoneService _phoneService = PhoneService();

  _PhoneCallScreen({required this.snapshot});

  String get _title => switch (snapshot.status) {
    PhoneCallStatus.calling => 'Calling…',
    PhoneCallStatus.ringing when snapshot.accepting => 'Connecting…',
    PhoneCallStatus.ringing => 'Incoming call',
    PhoneCallStatus.inCall => 'Connected',
    PhoneCallStatus.idle => '',
  };

  bool get _isVideo => snapshot.callType == PhoneCallType.video;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (snapshot.status == PhoneCallStatus.inCall && _isVideo)
              RTCVideoView(
                _phoneService.remoteRenderer,
                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              )
            else
              Container(color: const Color(0xFF111111)),

            if (snapshot.status == PhoneCallStatus.inCall &&
                _isVideo &&
                !snapshot.cameraOff)
              Positioned(
                right: 16,
                top: 16,
                width: 110,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: RTCVideoView(
                    _phoneService.localRenderer,
                    mirror: true,
                    objectFit:
                        RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                  ),
                ),
              ),

            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: snapshot.peerAvatarUrl != null
                        ? NetworkImage(snapshot.peerAvatarUrl!)
                        : null,
                    child: snapshot.peerAvatarUrl == null
                        ? Text(
                            snapshot.peerDisplayName.isNotEmpty
                                ? snapshot.peerDisplayName[0].toUpperCase()
                                : '?',
                            style: const TextStyle(fontSize: 28),
                          )
                        : null,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    snapshot.peerDisplayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _title,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: _buildControls(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    switch (snapshot.status) {
      case PhoneCallStatus.calling:
        return _controlsRow([
          _actionButton(
            icon: FLucideIcons.phoneOff,
            color: Colors.red,
            onPressed: _phoneService.cancel,
          ),
        ]);
      case PhoneCallStatus.ringing:
        if (snapshot.accepting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return _controlsRow([
          _actionButton(
            icon: FLucideIcons.phoneOff,
            color: Colors.red,
            onPressed: _phoneService.reject,
          ),
          _actionButton(
            icon: FLucideIcons.phone,
            color: Colors.green,
            onPressed: _phoneService.accept,
          ),
        ]);
      case PhoneCallStatus.inCall:
        return _controlsRow([
          _actionButton(
            icon: snapshot.micMuted ? FLucideIcons.micOff : FLucideIcons.mic,
            color: Colors.white24,
            onPressed: _phoneService.toggleMic,
          ),
          if (_isVideo)
            _actionButton(
              icon: snapshot.cameraOff
                  ? FLucideIcons.videoOff
                  : FLucideIcons.video,
              color: Colors.white24,
              onPressed: _phoneService.toggleCamera,
            ),
          _actionButton(
            icon: FLucideIcons.phoneOff,
            color: Colors.red,
            onPressed: _phoneService.end,
          ),
        ]);
      case PhoneCallStatus.idle:
        return const SizedBox.shrink();
    }
  }

  Widget _controlsRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget _actionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

import 'dart:convert';

import 'package:app/config/config_response.dart';
import 'package:app/device/device_id.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketClient {
  final DeviceId _deviceId = DeviceId();
  static late WebSocketChannel _channel;

  void boot(ConfigResponse config) async {
    final uri = Uri.parse(config.config.websocket.url).replace(
      queryParameters: {
        'token': jsonEncode({'deviceId': await _deviceId.get()}),
      },
    );
    _channel = WebSocketChannel.connect(uri);
    _channel.stream.listen(
      (message) {
        if (message is List<int>) {
          print(utf8.decode(message));
        }
      },
      onError: (error) {
        print(error);
      },
      onDone: () {
        print('-------------- connected');
      },
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:app/config/config_response.dart';
import 'package:app/device/device_id.dart';
import 'package:event_bus/event_bus.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart' as ws;

import 'broadcast/broadcast_manager.dart';
import 'callback/websocket_callback.dart';
import 'channel/websocket_channel.dart';
import 'payload/websocket_payload.dart';
import 'types.dart';

export 'broadcast/base_broadcast.dart';
export 'broadcast/broadcast_manager.dart';
export 'broadcast/types.dart';
export 'callback/websocket_callback.dart';
export 'channel/websocket_channel.dart';
export 'controller/websocket_controller.dart';
export 'payload/websocket_payload.dart';
export 'types.dart';

typedef WebsocketClient = WebSocketClient;

class WebSocketClient implements IWebSocket {
  final _uuid = const Uuid();
  final DeviceId _deviceId = DeviceId();

  late final BroadcastManager broadcast;
  final Map<String, WebSocketChannel> channels = {};
  final WebSocketState state = WebSocketState(connected: false);
  final EventBus events;
  final List<WsClientLog> logs = [];
  late String token;

  ws.WebSocketChannel? _socket;
  StreamSubscription? _subscription;

  final WebSocketCallback _callback = WebSocketCallback();
  final Map<String, WsCTRLResponseFn> _ctrlResponse = {};

  final List<WsModifyPayloadFn> _modifyPayloadHooks = [];
  final List<WsBeforeSendFn> _beforeSendHooks = [];
  final List<WebsocketConnectedFn> _connectedHooks = [];

  WebSocketClient({EventBus? eventBus}) : events = eventBus ?? EventBus() {
    token = _uuid.v4().replaceAll('-', '') + _uuid.v4().replaceAll('-', '');
    broadcast = BroadcastManager(this);

    events.on<Map>().listen((event) {
      final name = event['event']?.toString();
      if (name == 'mesh::client_add_log' && event['log'] != null) {
        final logMap = event['log'] is Map ? (event['log'] as Map) : {};
        logs.add(WsClientLog(
          message: logMap['message']?.toString() ?? '',
          type: logMap['type']?.toString() ?? 'info',
          payload: logMap['payload'] is Map
              ? Map<String, dynamic>.from(logMap['payload'] as Map)
              : const {},
          key: logMap['key']?.toString(),
          dateTime: logMap['dateTime']?.toString() ??
              DateTime.now().toIso8601String(),
        ));
      } else if (name == 'mesh::client_clear_logs') {
        logs.clear();
      } else if (name == 'mesh::client_initialize' && event['token'] != null) {
        token = event['token'].toString();
      }
    });
  }

  @override
  String getToken() => token;

  List<WsClientLog> getLogs() => logs;

  void onModifyPayload(WsModifyPayloadFn fn) => _modifyPayloadHooks.add(fn);
  void onBeforeSend(WsBeforeSendFn fn) => _beforeSendHooks.add(fn);

  WebSocketChannel channel(String ch) {
    return channels.putIfAbsent(
      ch,
      () => WebSocketChannel(
        name: ch,
        onDestroy: (name) => channels.remove(name),
      ),
    );
  }

  Future<void> boot(ConfigResponse config) async {
    final devId = await _deviceId.get();
    final clientId = config.clientId.isNotEmpty ? config.clientId : devId;
    connect(config, clientId, devId);
  }

  void connect(
    dynamic config,
    String clientId,
    String deviceId, [
    WebsocketConnectedFn? connected,
  ]) {
    if (connected != null) {
      _connectedHooks.add(connected);
    }

    String wsUrl = '';
    if (config is ConfigResponse) {
      wsUrl = config.config.websocket.url;
    } else if (config is String) {
      wsUrl = config;
    } else if (config is Map) {
      wsUrl = config['websocket']?['url']?.toString() ??
          config['url']?.toString() ??
          '';
    }

    final uri = Uri.parse(wsUrl).replace(
      queryParameters: {
        'token': jsonEncode({
          'version': '1.0',
          'clientId': clientId,
          'deviceId': deviceId,
        }),
        'type': 'client-worker',
      },
    );

    events.fire({
      'event': 'websocket:before:connect',
      'clientId': clientId,
      'url': uri.toString(),
    });

    try {
      _subscription?.cancel();
      _socket = ws.WebSocketChannel.connect(uri);

      _subscription = _socket!.stream.listen(
        (data) {
          _onDataReceived(data);
        },
        onError: (error) {
          state.connected = false;
          events.fire({
            'event': 'websocket:error',
            'error': error.toString(),
          });
        },
        onDone: () {
          state.connected = false;
          events.fire({
            'event': 'websocket:disconnected',
            'state': state.toJson(),
          });
        },
      );
    } catch (e) {
      state.connected = false;
      events.fire({
        'event': 'websocket:error',
        'error': e.toString(),
      });
    }
  }

  void _onDataReceived(dynamic rawData) {
    String jsonString = '';
    if (rawData is List<int>) {
      jsonString = utf8.decode(rawData);
    } else if (rawData is String) {
      jsonString = rawData;
    } else {
      jsonString = rawData.toString();
    }

    Map<String, dynamic> data;
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        data = decoded;
      } else if (decoded is Map) {
        data = Map<String, dynamic>.from(decoded);
      } else {
        return;
      }
    } catch (_) {
      return;
    }

    if (!state.connected) {
      state.connected = true;
      events.fire({
        'event': 'websocket:connected',
        'client': this,
        'state': state.toJson(),
      });
      for (final hook in List<WebsocketConnectedFn>.from(_connectedHooks)) {
        hook(true);
      }
    }

    if (data['ping'] == true) {
      events.fire({
        'event': 'websocket:ping',
        'message': data,
      });
      send({'pong': true});
      return;
    }

    if (data['channel'] != null) {
      final chName = data['channel'].toString();
      channels[chName]?.dispatch(data);
      return;
    }

    if (data['broadcast'] != null && data['action'] != null) {
      broadcast.dispatch(
        data['broadcast'].toString(),
        data['action'].toString(),
        data,
      );
      return;
    }

    if (data['emits'] != null && data['emits'] is List) {
      for (final emit in data['emits']) {
        if (emit is Map) {
          final eventName = emit['event']?.toString() ?? '';
          final payload = (emit['payload'] as Map<String, dynamic>?) ?? {};
          events.fire({
            'event': eventName,
            'payload': payload,
          });
        }
      }
    }

    if (data['controller'] != null && data['controller'] is Map) {
      final ctrl = data['controller'] as Map;
      final ctrlId = ctrl['id']?.toString() ?? '';
      final fn = _ctrlResponse.remove(ctrlId);
      if (fn != null) {
        final result = WsCTRLResult<dynamic>.fromJson(
          (ctrl['result'] as Map<String, dynamic>?) ?? {},
        );
        final info = WsCTRLInfo.fromJson(
          (ctrl['info'] as Map<String, dynamic>?) ?? {},
        );
        fn(result, info);
      }
    }

    if (data['callbackId'] != null) {
      final cbId = data['callbackId'].toString();
      final cb = _callback.get(cbId);
      cb?.call(data);
    }

    events.fire({
      'event': 'websocket:incoming:message',
      'message': data,
    });
  }

  @override
  void disconnect() {
    _subscription?.cancel();
    _subscription = null;
    _socket?.sink.close();
    _socket = null;
    state.connected = false;
    events.fire({
      'event': 'websocket:disconnected',
      'state': state.toJson(),
    });
  }

  @override
  void emit(String event, [dynamic payload]) {
    send({
      'emits': [
        {
          'event': event,
          'payload': ?payload,
        }
      ],
      'requestId': _uuid.v4().replaceAll('-', ''),
    });
  }

  @override
  void command(String cmd, [dynamic payload = const {}]) {
    send({
      'command': cmd,
      'payload': payload ?? {},
      'requestId': _uuid.v4().replaceAll('-', ''),
    });
  }

  WebSocketPayload payload() {
    return WebSocketPayload(this);
  }

  @override
  void send(Map<String, dynamic> payload) {
    Map<String, dynamic> data = Map<String, dynamic>.from(payload);

    data.putIfAbsent(
      'requestId',
      () => _uuid.v4().replaceAll('-', ''),
    );

    if (data.containsKey('callbackFn')) {
      final fn = data.remove('callbackFn');
      if (fn is WsCallbackFn) {
        data['callbackId'] = _callback.set(fn);
      }
    }

    if (data['controller'] != null) {
      final controllers = data['controller'];
      if (controllers is List) {
        final exportedList = <Map<String, dynamic>>[];
        for (final ctrl in controllers) {
          if (ctrl is WsSenderCTRL) {
            if (ctrl.responseFn != null) {
              _ctrlResponse[ctrl.id] = ctrl.responseFn!;
            }
            exportedList.add(ctrl.toJson());
          } else if (ctrl is Map<String, dynamic>) {
            exportedList.add(ctrl);
          }
        }
        data['controller'] = exportedList;
      }
    }

    for (final hook in _modifyPayloadHooks) {
      data = hook(data);
    }

    for (final hook in _beforeSendHooks) {
      hook(data);
    }

    try {
      final encoded = utf8.encode(jsonEncode(data));
      _socket?.sink.add(Uint8List.fromList(encoded));
    } catch (e) {
      events.fire({
        'event': 'websocket:error',
        'error': e.toString(),
      });
    }
  }
}

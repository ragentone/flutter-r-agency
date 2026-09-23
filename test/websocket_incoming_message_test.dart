import 'package:app/websocket/websocket.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WsIncomingMessage data model', () {
    test('parses empty / minimal json correctly', () {
      final msg = WsIncomingMessage.fromJson({});
      expect(msg.isPing, isFalse);
      expect(msg.isPong, isFalse);
      expect(msg.hasChannel, isFalse);
      expect(msg.hasBroadcast, isFalse);
      expect(msg.hasEmits, isFalse);
      expect(msg.hasController, isFalse);
      expect(msg.hasCallback, isFalse);
      expect(msg.hasNotify, isFalse);
      expect(msg.hasExceptions, isFalse);
    });

    test('parses ping and pong flags', () {
      final pingMsg = WsIncomingMessage.fromJson({'ping': true});
      expect(pingMsg.isPing, isTrue);
      expect(pingMsg.isPong, isFalse);

      final pongMsg = WsIncomingMessage.fromJson({'pong': true});
      expect(pongMsg.isPong, isTrue);
      expect(pongMsg.isPing, isFalse);
    });

    test('parses emits and payload correctly', () {
      final msg = WsIncomingMessage.fromJson({
        'emits': [
          {
            'event': 'custom_event',
            'payload': {'count': 42},
          },
          {
            'event': 'second_event',
          }
        ]
      });

      expect(msg.hasEmits, isTrue);
      expect(msg.emits?.length, 2);
      expect(msg.emits?[0].event, 'custom_event');
      expect(msg.emits?[0].payload['count'], 42);
      expect(msg.emits?[1].event, 'second_event');
      expect(msg.emits?[1].payload, isEmpty);
    });

    test('parses notify objects correctly', () {
      final msg = WsIncomingMessage.fromJson({
        'notify': [
          {
            'type': 'warning',
            'title': 'Alert',
            'message': 'Warning occurred',
            'code': 400,
            'duration': 5000,
            'translateKey': 'warn.key',
            'payload': {'foo': 'bar'},
          }
        ]
      });

      expect(msg.hasNotify, isTrue);
      expect(msg.notify?.length, 1);
      final notify = msg.notify![0];
      expect(notify.type, 'warning');
      expect(notify.title, 'Alert');
      expect(notify.message, 'Warning occurred');
      expect(notify.code, 400);
      expect(notify.duration, 5000);
      expect(notify.translateKey, 'warn.key');
      expect(notify.payload['foo'], 'bar');
    });

    test('parses exceptions / MeshError objects correctly', () {
      final msg = WsIncomingMessage.fromJson({
        'exceptions': [
          {
            'code': 500,
            'name': 'ServerError',
            'message': 'Internal error',
            'translateKey': 'err.internal',
            'payload': {'detail': 'crash'},
          }
        ]
      });

      expect(msg.hasExceptions, isTrue);
      expect(msg.exceptions?.length, 1);
      final error = msg.exceptions![0];
      expect(error.code, 500);
      expect(error.name, 'ServerError');
      expect(error.message, 'Internal error');
      expect(error.translateKey, 'err.internal');
      expect(error.payload['detail'], 'crash');
    });

    test('parses controller and info correctly', () {
      final msg = WsIncomingMessage.fromJson({
        'controller': {
          'id': 'ctrl-123',
          'result': {
            'success': true,
            'data': {'userId': 'user-1'},
          },
          'info': {
            'executed': true,
            'hrtime': '123456',
          }
        }
      });

      expect(msg.hasController, isTrue);
      final ctrl = msg.controller!;
      expect(ctrl.id, 'ctrl-123');
      expect(ctrl.result.success, isTrue);
      expect(ctrl.result.data['userId'], 'user-1');
      expect(ctrl.info.executed, isTrue);
      expect(ctrl.info.hrtime, '123456');
    });

    test('parses broadcast and channel fields correctly', () {
      final msg = WsIncomingMessage.fromJson({
        'channel': 'room-1',
        'broadcast': 'dashboard',
        'action': 'refresh',
        'callbackId': 'cb-999',
        'requestId': 'req-888',
        'code': 'OK',
      });

      expect(msg.hasChannel, isTrue);
      expect(msg.channel, 'room-1');
      expect(msg.hasBroadcast, isTrue);
      expect(msg.broadcast, 'dashboard');
      expect(msg.action, 'refresh');
      expect(msg.hasCallback, isTrue);
      expect(msg.callbackId, 'cb-999');
      expect(msg.requestId, 'req-888');
      expect(msg.code, 'OK');
    });

    test('toJson produces expected structure', () {
      final msg = WsIncomingMessage(
        ping: true,
        channel: 'ch1',
        broadcast: 'bc1',
        action: 'act1',
        requestId: 'req1',
        emits: [WsEmit(event: 'test', payload: {'k': 'v'})],
      );

      final json = msg.toJson();
      expect(json['ping'], isTrue);
      expect(json['channel'], 'ch1');
      expect(json['broadcast'], 'bc1');
      expect(json['action'], 'act1');
      expect(json['requestId'], 'req1');
      expect(json['emits'], isNotEmpty);
    });

    test('WsEventIncomingMessage wraps WsIncomingMessage', () {
      final msg = WsIncomingMessage.fromJson({'ping': true});
      final event = WsEventIncomingMessage(msg);
      expect(event.message?.isPing, isTrue);
    });
  });
}

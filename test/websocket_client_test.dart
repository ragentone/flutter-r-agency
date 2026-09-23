import 'package:app/websocket/websocket.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WebSocketCallback', () {
    test('sets and gets callback by id', () {
      final callback = WebSocketCallback();
      bool called = false;
      final id = callback.set((data) {
        called = true;
        expect(data['test'], equals('value'));
      });

      expect(id, isNotEmpty);
      final fn = callback.get(id);
      expect(fn, isNotNull);
      fn!({'test': 'value'});
      expect(called, isTrue);

      // Subsequent get returns null (one-time callback)
      expect(callback.get(id), isNull);
    });

    test('clear removes all callbacks', () {
      final callback = WebSocketCallback();
      final id = callback.set((data) {});
      callback.clear();
      expect(callback.get(id), isNull);
    });
  });

  group('WebSocketChannel', () {
    test('handles event listening and dispatching with once and sortOrder', () {
      bool destroyed = false;
      final channel = WebSocketChannel(
        name: 'chat-room',
        onDestroy: (name) {
          destroyed = true;
        },
      );

      final order = <int>[];
      final unsubs = channel.on(
        'message',
        (args) {
          order.add(2);
        },
        const WsChannelEventOptions(sortOrder: 10),
      );

      channel.on(
        'message',
        (args) {
          order.add(1);
          expect(args.payload['text'], equals('hello'));
        },
        const WsChannelEventOptions(once: true, sortOrder: 1),
      );

      channel.dispatch({
        'channel': 'chat-room',
        'emits': [
          {
            'event': 'message',
            'payload': {'text': 'hello'}
          }
        ]
      });

      expect(order, equals([1, 2]));

      // Second dispatch should only trigger listener #2 because #1 had once: true
      order.clear();
      channel.dispatch({
        'channel': 'chat-room',
        'emits': [
          {
            'event': 'message',
            'payload': {'text': 'world'}
          }
        ]
      });

      expect(order, equals([2]));

      unsubs();
      order.clear();
      channel.dispatch({
        'channel': 'chat-room',
        'emits': [
          {
            'event': 'message',
            'payload': {'text': 'again'}
          }
        ]
      });
      expect(order, isEmpty);

      channel.destroy();
      expect(destroyed, isTrue);
    });

    test('handles onNotify and onGlobal', () {
      final channel = WebSocketChannel(name: 'system', onDestroy: (_) {});
      final globalMessages = <Map<String, dynamic>>[];
      final notifies = <dynamic>[];

      channel.onGlobal((msg) => globalMessages.add(msg));
      channel.onNotify((n) => notifies.add(n));

      final msg = {
        'channel': 'system',
        'notify': [{'id': 1}, {'id': 2}],
      };
      channel.dispatch(msg);

      expect(globalMessages.length, equals(1));
      expect(notifies.length, equals(2));
    });
  });

  group('WebSocketPayload & Controller', () {
    test('builds payload with emits, command, data, and controllers', () {
      final eventBus = EventBus();
      final client = WebSocket(eventBus: eventBus);

      final payload = client.payload()
        ..emit('user::login', {'userId': 123})
        ..command('sync', {'mode': 'full'})
        ..setData({'custom': 'data'});

      final ctrl = payload.controller('auth');
      ctrl.action('verify', data: {'token': 'abc'});

      expect(client.getToken(), isNotEmpty);
      expect(client.state.connected, isFalse);
    });
  });

  group('BroadcastManager & BaseBroadcast', () {
    test('creates broadcast model and dispatches lifecycle events', () {
      final eventBus = EventBus();
      final client = WebSocket(eventBus: eventBus);
      final manager = client.broadcast;

      bool createdFired = false;
      manager.onCreated((data) {
        createdFired = true;
        expect(data.name, equals('room-0'));
      });

      manager.dispatch('room-0', 'created', {
        'data': {
          'id': 'b-0',
          'name': 'room-0',
          'data': {},
          'state': {},
          'meta': {'name': 'room-0'},
        }
      });
      expect(createdFired, isTrue);

      bool selfJoinedFired = false;
      manager.onSelfJoined((data) {
        selfJoinedFired = true;
        expect(data.name, equals('room-1'));
      });

      // Dispatch 'selfJoined' event
      manager.dispatch('room-1', 'selfJoined', {
        'data': {
          'id': 'b-123',
          'name': 'room-1',
          'data': {'title': 'My Broadcast'},
          'state': {'status': 'active'},
          'meta': {
            'clientsTotal': 1,
            'clients': {
              'dev-1': {
                'deviceId': 'dev-1',
                'clientId': 'cli-1',
                'meta': {'name': 'Alice'},
              }
            },
            'alias': 'alias-1',
            'tag': 'tag-1',
            'id': 'b-123',
            'name': 'room-1',
          },
          'self': {
            'deviceId': 'dev-1',
            'clientId': 'cli-1',
            'meta': {'name': 'Alice'},
          }
        }
      });

      expect(selfJoinedFired, isTrue);
      expect(manager.total(), equals(2));
      final broadcast = manager.get('room-1');
      expect(broadcast, isNotNull);
      expect(broadcast!.getName(), equals('room-1'));
      expect(broadcast.getId(), equals('b-123'));
      expect(broadcast.getData()['title'], equals('My Broadcast'));
      expect(broadcast.getState()['status'], equals('active'));
      expect(broadcast.getSelf()?.clientId, equals('cli-1'));

      // Dispatch 'clientJoined'
      bool clientJoinedFired = false;
      manager.onClientJoined((data) {
        clientJoinedFired = true;
      });

      manager.dispatch('room-1', 'clientJoined', {
        'data': {
          'id': 'b-123',
          'name': 'room-1',
          'client': {
            'deviceId': 'dev-2',
            'clientId': 'cli-2',
            'meta': {'name': 'Bob'},
          }
        }
      });

      expect(clientJoinedFired, isTrue);
      expect(broadcast.clients().length, equals(2));

      // Dispatch 'clientLeaved'
      bool clientLeavedFired = false;
      manager.onClientLeaved((data) {
        clientLeavedFired = true;
      });

      manager.dispatch('room-1', 'clientLeaved', {
        'data': {
          'id': 'b-123',
          'name': 'room-1',
          'client': {
            'deviceId': 'dev-2',
            'clientId': 'cli-2',
          }
        }
      });

      expect(clientLeavedFired, isTrue);
      expect(broadcast.clients().length, equals(1));

      // Dispatch 'selfUpdate'
      manager.dispatch('room-1', 'selfUpdate', {
        'data': {
          'id': 'b-123',
          'name': 'room-1',
          'data': {'title': 'Updated Title', 'newKey': 42},
          'meta': {},
          'state': {'status': 'idle'},
        }
      });

      expect(broadcast.getData()['title'], equals('Updated Title'));
      expect(broadcast.getData()['newKey'], equals(42));
      expect(broadcast.getState()['status'], equals('idle'));
    });

    test('deepMerge correctly merges nested maps without overwriting unmodified values', () {
      final target = {
        'a': 1,
        'nested': {'x': 10, 'y': 20},
      };
      final source = {
        'b': 2,
        'nested': {'y': 30, 'z': 40},
      };

      final merged = deepMerge(target, source);
      expect(merged['a'], equals(1));
      expect(merged['b'], equals(2));
      expect(merged['nested']['x'], equals(10));
      expect(merged['nested']['y'], equals(30));
      expect(merged['nested']['z'], equals(40));
    });
  });

  group('WebSocketClient Hooks and Events', () {
    test('modifies payload and executes beforeSend hooks', () {
      final client = WebSocket();

      client.onModifyPayload((payload) {
        payload['modified'] = true;
        return payload;
      });

      bool beforeSendCalled = false;
      client.onBeforeSend((payload) {
        beforeSendCalled = true;
        expect(payload['modified'], isTrue);
      });

      client.send({'test': 123});
      expect(beforeSendCalled, isTrue);
    });

    test('manages client logs via EventBus', () async {
      final eventBus = EventBus();
      final client = WebSocket(eventBus: eventBus);

      expect(client.getLogs(), isEmpty);

      eventBus.fire({
        'event': 'mesh::client_add_log',
        'log': {
          'message': 'Connected to mesh network',
          'type': 'info',
          'payload': {'ip': '127.0.0.1'},
          'dateTime': '2026-09-23T12:00:00Z',
        }
      });

      await Future.delayed(Duration.zero);

      expect(client.getLogs().length, equals(1));
      expect(client.getLogs().first.message, equals('Connected to mesh network'));

      eventBus.fire({'event': 'mesh::client_clear_logs'});
      await Future.delayed(Duration.zero);
      expect(client.getLogs(), isEmpty);
    });
  });
}

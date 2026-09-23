typedef BroadcastJoinedFn = void Function(dynamic broadcast);
typedef OnCreateBroadcastFn = dynamic Function(CreatedData data);
typedef OnIncomingMessageFn = void Function(Map<String, dynamic> args);
typedef OnSelfJoinedFn = void Function(SelfJoinedData data);
typedef OnSelfLeavedFn = void Function(SelfLeavedData data);
typedef OnSelfUpdateFn = void Function(SelfUpdateData data);
typedef OnClientJoinedFn = void Function(ClientJoinedData data);
typedef OnClientLeavedFn = void Function(ClientLeavedData data);
typedef OnCreatedFn = void Function(CreatedData data);
typedef OnRemovedFn = void Function(Map<String, dynamic> data);
typedef OnDestroyFn = void Function(Map<String, dynamic> data);
typedef BroadcastInternalOnCreatedFn = void Function(dynamic broadcast);
typedef BroadcastCallbackFn<T> = void Function(T response);

Map<String, dynamic> _toMap(dynamic val) {
  if (val == null) return {};
  if (val is Map<String, dynamic>) return val;
  if (val is Map) return Map<String, dynamic>.from(val);
  return {};
}

Map<String, dynamic> deepMerge(
  Map<String, dynamic> target,
  Map<String, dynamic> source,
) {
  final output = Map<String, dynamic>.from(target);
  for (final entry in source.entries) {
    final key = entry.key;
    final sourceValue = entry.value;
    final targetValue = output[key];

    if (sourceValue is Map && targetValue is Map) {
      output[key] = deepMerge(_toMap(targetValue), _toMap(sourceValue));
    } else if (sourceValue != null) {
      output[key] = sourceValue;
    }
  }
  return output;
}

class BroadcastMeta {
  int clientsTotal;
  String createdAt;
  String lastUpdate;
  Map<String, BroadcastClientData> clients;
  String alias;
  String tag;
  String token;
  bool protected;
  String id;
  String name;
  String? ownerId;
  String? link;
  bool autoJoin;
  dynamic custom;

  BroadcastMeta({
    this.clientsTotal = 0,
    this.createdAt = '',
    this.lastUpdate = '',
    this.clients = const {},
    this.alias = '',
    this.tag = '',
    this.token = '',
    this.protected = false,
    this.id = '',
    this.name = '',
    this.ownerId,
    this.link,
    this.autoJoin = false,
    this.custom,
  });

  factory BroadcastMeta.fromJson(Map<String, dynamic> json) {
    final clientsMap = <String, BroadcastClientData>{};
    if (json['clients'] != null && json['clients'] is Map) {
      final map = json['clients'] as Map;
      map.forEach((k, v) {
        if (v is Map) {
          clientsMap[k.toString()] = BroadcastClientData.fromJson(_toMap(v));
        }
      });
    }

    return BroadcastMeta(
      clientsTotal: json['clientsTotal'] as int? ?? 0,
      createdAt: json['createdAt']?.toString() ?? '',
      lastUpdate: json['lastUpdate']?.toString() ?? '',
      clients: clientsMap,
      alias: json['alias']?.toString() ?? '',
      tag: json['tag']?.toString() ?? '',
      token: json['token']?.toString() ?? '',
      protected: json['protected'] as bool? ?? false,
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      ownerId: json['ownerId']?.toString(),
      link: json['link']?.toString(),
      autoJoin: json['autoJoin'] as bool? ?? false,
      custom: json['custom'],
    );
  }

  Map<String, dynamic> toJson() => {
    'clientsTotal': clientsTotal,
    'createdAt': createdAt,
    'lastUpdate': lastUpdate,
    'clients': clients.map((k, v) => MapEntry(k, v.toJson())),
    'alias': alias,
    'tag': tag,
    'token': token,
    'protected': protected,
    'id': id,
    'name': name,
    if (ownerId != null) 'ownerId': ownerId,
    if (link != null) 'link': link,
    'autoJoin': autoJoin,
    if (custom != null) 'custom': custom,
  };
}

class BroadcastClientData {
  final String deviceId;
  final String clientId;
  final Map<String, dynamic> meta;
  final Map<String, dynamic> raw;

  BroadcastClientData({
    required this.deviceId,
    required this.clientId,
    this.meta = const {},
    this.raw = const {},
  });

  factory BroadcastClientData.fromJson(Map<String, dynamic> json) {
    return BroadcastClientData(
      deviceId: json['deviceId']?.toString() ?? '',
      clientId: json['clientId']?.toString() ?? '',
      meta: _toMap(json['meta']),
      raw: json,
    );
  }

  Map<String, dynamic> toJson() => {
    'deviceId': deviceId,
    'clientId': clientId,
    'meta': meta,
    ...raw,
  };
}

class BroadcastLog {
  final String message;
  final String type;
  final Map<String, dynamic> payload;
  final String dateTime;

  BroadcastLog({
    required this.message,
    this.type = 'info',
    this.payload = const {},
    required this.dateTime,
  });

  factory BroadcastLog.fromJson(Map<String, dynamic> json) {
    return BroadcastLog(
      message: json['message']?.toString() ?? '',
      type: json['type']?.toString() ?? 'info',
      payload: _toMap(json['payload']),
      dateTime: json['dateTime']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'type': type,
    'payload': payload,
    'dateTime': dateTime,
  };
}

class BroadcastModel {
  Map<String, dynamic> data;
  BroadcastMeta meta;
  Map<String, dynamic> state;
  Map<String, BroadcastClientData> clients;
  BroadcastClientData? self;
  String id;
  String name;
  List<BroadcastLog> logs;

  BroadcastModel({
    required this.data,
    required this.meta,
    required this.state,
    required this.clients,
    this.self,
    required this.id,
    required this.name,
    this.logs = const [],
  });
}

class CreatedData {
  final String id;
  final String name;
  final Map<String, dynamic> data;
  final BroadcastMeta meta;
  final Map<String, dynamic> state;
  final String alias;
  final String tag;

  CreatedData({
    required this.id,
    required this.name,
    this.data = const {},
    required this.meta,
    this.state = const {},
    this.alias = '',
    this.tag = '',
  });

  factory CreatedData.fromJson(Map<String, dynamic> json) {
    final metaJson = _toMap(json['meta']);
    return CreatedData(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      data: _toMap(json['data']),
      meta: BroadcastMeta.fromJson(metaJson),
      state: _toMap(json['state']),
      alias: json['alias']?.toString() ?? metaJson['alias']?.toString() ?? '',
      tag: json['tag']?.toString() ?? metaJson['tag']?.toString() ?? '',
    );
  }
}

class SelfJoinedData {
  final String id;
  final String name;
  final Map<String, dynamic> data;
  final BroadcastMeta meta;
  final Map<String, dynamic> state;
  final BroadcastClientData self;

  SelfJoinedData({
    required this.id,
    required this.name,
    this.data = const {},
    required this.meta,
    this.state = const {},
    required this.self,
  });

  factory SelfJoinedData.fromJson(Map<String, dynamic> json) {
    return SelfJoinedData(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      data: _toMap(json['data']),
      meta: BroadcastMeta.fromJson(_toMap(json['meta'])),
      state: _toMap(json['state']),
      self: BroadcastClientData.fromJson(_toMap(json['self'])),
    );
  }
}

class SelfLeavedData {
  final String id;
  final String name;

  SelfLeavedData({required this.id, required this.name});

  factory SelfLeavedData.fromJson(Map<String, dynamic> json) {
    return SelfLeavedData(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }
}

class SelfUpdateData {
  final String id;
  final String name;
  final Map<String, dynamic> data;
  final Map<String, dynamic> meta;
  final Map<String, dynamic> state;

  SelfUpdateData({
    required this.id,
    required this.name,
    this.data = const {},
    this.meta = const {},
    this.state = const {},
  });

  factory SelfUpdateData.fromJson(Map<String, dynamic> json) {
    return SelfUpdateData(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      data: _toMap(json['data']),
      meta: _toMap(json['meta']),
      state: _toMap(json['state']),
    );
  }
}

class ClientJoinedData {
  final String id;
  final String name;
  final BroadcastClientData client;

  ClientJoinedData({
    required this.id,
    required this.name,
    required this.client,
  });

  factory ClientJoinedData.fromJson(Map<String, dynamic> json) {
    return ClientJoinedData(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      client: BroadcastClientData.fromJson(_toMap(json['client'])),
    );
  }
}

class ClientLeavedData {
  final String id;
  final String name;
  final BroadcastClientData client;

  ClientLeavedData({
    required this.id,
    required this.name,
    required this.client,
  });

  factory ClientLeavedData.fromJson(Map<String, dynamic> json) {
    return ClientLeavedData(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      client: BroadcastClientData.fromJson(_toMap(json['client'])),
    );
  }
}

class EmitData {
  final String id;
  final String name;
  final Map<String, dynamic> emit;

  EmitData({
    required this.id,
    required this.name,
    required this.emit,
  });

  factory EmitData.fromJson(Map<String, dynamic> json) {
    return EmitData(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      emit: _toMap(json['emit']),
    );
  }
}

class BroadcastCreateOptions {
  final int? maxClients;
  final bool? protected;
  final dynamic data;
  final dynamic state;
  final dynamic join;
  final String? alias;
  final bool? autoJoin;
  final bool? validateToken;
  final dynamic custom;
  final BroadcastInternalOnCreatedFn? onCreated;

  const BroadcastCreateOptions({
    this.maxClients,
    this.protected,
    this.data,
    this.state,
    this.join,
    this.alias,
    this.autoJoin,
    this.validateToken,
    this.custom,
    this.onCreated,
  });
}

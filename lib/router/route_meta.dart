import 'dart:collection';

enum RouteMetaAccess { auth, nonAuth, always }

/// Typed route metadata object for GoRouter routes.
class RouteMeta extends MapView<String, dynamic> {
  final bool authorization;
  final String? title;
  final List<String> roles;
  final List<String> permissions;
  final bool guestOnly;
  final Map<String, dynamic> extra;
  final RouteMetaAccess access;

  RouteMeta({
    this.authorization = false,
    this.title,
    this.roles = const [],
    this.permissions = const [],
    this.guestOnly = false,
    this.extra = const {},
    this.access = RouteMetaAccess.always,
  }) : super(
         _buildMap(
           authorization: authorization,
           title: title,
           roles: roles,
           permissions: permissions,
           guestOnly: guestOnly,
           extra: extra,
         ),
       );

  /// Shorthand constructor for routes requiring authorization.
  factory RouteMeta.auth({
    String? title,
    List<String> roles = const [],
    List<String> permissions = const [],
    Map<String, dynamic> extra = const {},
  }) {
    return RouteMeta(
      authorization: true,
      title: title,
      roles: roles,
      permissions: permissions,
      extra: extra,
    );
  }

  /// Shorthand constructor for public routes.
  factory RouteMeta.public({
    String? title,
    Map<String, dynamic> extra = const {},
  }) {
    return RouteMeta(authorization: false, title: title, extra: extra);
  }

  /// Shorthand constructor for routes accessible only by unauthenticated guests.
  factory RouteMeta.guest({
    String? title,
    Map<String, dynamic> extra = const {},
  }) {
    return RouteMeta(
      authorization: false,
      guestOnly: true,
      title: title,
      extra: extra,
    );
  }

  /// Alias for [authorization].
  bool get requiresAuth => authorization;

  /// Whether this route is public (does not require authorization and is not guest-only).
  bool get isPublic => !authorization && !guestOnly;

  static Map<String, dynamic> _buildMap({
    required bool authorization,
    String? title,
    required List<String> roles,
    required List<String> permissions,
    required bool guestOnly,
    required Map<String, dynamic> extra,
  }) {
    return {
      'authorization': authorization,
      'title': ?title,
      if (roles.isNotEmpty) 'roles': roles,
      if (permissions.isNotEmpty) 'permissions': permissions,
      if (guestOnly) 'guestOnly': guestOnly,
      ...extra,
    };
  }

  /// Creates a [RouteMeta] from a map or dynamic object.
  factory RouteMeta.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return RouteMeta();
    }

    final bool auth =
        map['authorization'] == true ||
        map['requiresAuth'] == true ||
        map['auth'] == true;

    final String? title = map['title']?.toString();

    final List<String> roles = [];
    if (map['roles'] is List) {
      roles.addAll((map['roles'] as List).map((e) => e.toString()));
    }

    final List<String> permissions = [];
    if (map['permissions'] is List) {
      permissions.addAll((map['permissions'] as List).map((e) => e.toString()));
    }

    final bool guestOnly = map['guestOnly'] == true;

    final extra = Map<String, dynamic>.from(map)
      ..remove('authorization')
      ..remove('requiresAuth')
      ..remove('auth')
      ..remove('title')
      ..remove('roles')
      ..remove('permissions')
      ..remove('guestOnly');

    return RouteMeta(
      authorization: auth,
      title: title,
      roles: roles,
      permissions: permissions,
      guestOnly: guestOnly,
      extra: extra,
    );
  }

  /// Safely extracts or creates a [RouteMeta] from any dynamic metadata object.
  static RouteMeta from(dynamic metadata) {
    if (metadata is RouteMeta) {
      return metadata;
    }
    if (metadata is Map<String, dynamic>) {
      return RouteMeta.fromMap(metadata);
    }
    if (metadata is Map) {
      return RouteMeta.fromMap(Map<String, dynamic>.from(metadata));
    }
    return RouteMeta();
  }

  /// Exports the metadata to a map representation.
  Map<String, dynamic> export() => toMap();

  /// Converts the metadata to a map representation.
  Map<String, dynamic> toMap() => Map<String, dynamic>.from(this);

  /// Converts the metadata to a JSON map.
  Map<String, dynamic> toJson() => toMap();

  RouteMeta copyWith({
    bool? authorization,
    String? title,
    List<String> roles = const [],
    List<String> permissions = const [],
    bool? guestOnly,
    Map<String, dynamic>? extra,
  }) {
    return RouteMeta(
      authorization: authorization ?? this.authorization,
      title: title ?? this.title,
      roles: roles.isNotEmpty ? roles : this.roles,
      permissions: permissions.isNotEmpty ? permissions : this.permissions,
      guestOnly: guestOnly ?? this.guestOnly,
      extra: extra ?? this.extra,
    );
  }
}

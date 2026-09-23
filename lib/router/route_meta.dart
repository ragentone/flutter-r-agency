import 'dart:collection';

enum RouteMetaAccess { auth, nonAuth, always }

/// Typed route metadata object for GoRouter routes.
class RouteMeta extends MapView<String, dynamic> {
  final RouteMetaAccess access;
  final String? title;

  RouteMeta({
    this.access = RouteMetaAccess.always,
    this.title,
  }) : super(
         _buildMap(
           access: access,
           title: title,
         ),
       );

  /// Shorthand constructor for routes requiring authorization.
  factory RouteMeta.auth({String? title}) {
    return RouteMeta(
      access: RouteMetaAccess.auth,
      title: title,
    );
  }

  /// Shorthand constructor for routes accessible only when not authenticated.
  factory RouteMeta.nonAuth({String? title}) {
    return RouteMeta(
      access: RouteMetaAccess.nonAuth,
      title: title,
    );
  }

  /// Shorthand constructor for routes always accessible.
  factory RouteMeta.always({String? title}) {
    return RouteMeta(
      access: RouteMetaAccess.always,
      title: title,
    );
  }

  static Map<String, dynamic> _buildMap({
    required RouteMetaAccess access,
    String? title,
  }) {
    return {
      'access': access,
      'title': ?title,
    };
  }

  /// Creates a [RouteMeta] from a map or dynamic object.
  factory RouteMeta.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return RouteMeta();
    }

    RouteMetaAccess access = RouteMetaAccess.always;
    final rawAccess = map['access'];
    if (rawAccess is RouteMetaAccess) {
      access = rawAccess;
    } else if (rawAccess is String) {
      for (final value in RouteMetaAccess.values) {
        if (value.name.toLowerCase() == rawAccess.toLowerCase()) {
          access = value;
          break;
        }
      }
    }

    final String? title = map['title']?.toString();

    return RouteMeta(
      access: access,
      title: title,
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
    RouteMetaAccess? access,
    String? title,
  }) {
    return RouteMeta(
      access: access ?? this.access,
      title: title ?? this.title,
    );
  }
}

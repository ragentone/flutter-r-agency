import 'package:app/router/route_meta.dart';
import 'package:app/router/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('RouteMeta object tests', () {
    test('default constructor creates default metadata with access always', () {
      final meta = RouteMeta();
      expect(meta.access, equals(RouteMetaAccess.always));
      expect(meta.title, isNull);
      expect(meta['access'], equals(RouteMetaAccess.always));
    });

    test('RouteMeta.auth creates auth-access metadata', () {
      final meta = RouteMeta.auth(title: 'Dashboard');
      expect(meta.access, equals(RouteMetaAccess.auth));
      expect(meta.title, equals('Dashboard'));
      expect(meta['access'], equals(RouteMetaAccess.auth));
      expect(meta['title'], equals('Dashboard'));
    });

    test('RouteMeta.nonAuth creates nonAuth-access metadata', () {
      final meta = RouteMeta.nonAuth(title: 'Login');
      expect(meta.access, equals(RouteMetaAccess.nonAuth));
      expect(meta.title, equals('Login'));
      expect(meta['access'], equals(RouteMetaAccess.nonAuth));
      expect(meta['title'], equals('Login'));
    });

    test('RouteMeta.always creates always-access metadata', () {
      final meta = RouteMeta.always(title: 'Home');
      expect(meta.access, equals(RouteMetaAccess.always));
      expect(meta.title, equals('Home'));
      expect(meta['access'], equals(RouteMetaAccess.always));
      expect(meta['title'], equals('Home'));
    });

    test('RouteMeta.fromMap parses enum and string access correctly', () {
      final map1 = {
        'access': RouteMetaAccess.auth,
        'title': 'Settings',
      };
      final meta1 = RouteMeta.fromMap(map1);
      expect(meta1.access, equals(RouteMetaAccess.auth));
      expect(meta1.title, equals('Settings'));

      final map2 = {
        'access': 'nonAuth',
        'title': 'Register',
      };
      final meta2 = RouteMeta.fromMap(map2);
      expect(meta2.access, equals(RouteMetaAccess.nonAuth));
      expect(meta2.title, equals('Register'));
    });

    test('RouteMeta.from handles various inputs', () {
      final original = RouteMeta.auth(title: 'Auth Page');
      expect(RouteMeta.from(original), same(original));

      final fromMap = RouteMeta.from({'access': 'auth', 'title': 'Map Page'});
      expect(fromMap.access, equals(RouteMetaAccess.auth));
      expect(fromMap.title, equals('Map Page'));

      final fromNull = RouteMeta.from(null);
      expect(fromNull.access, equals(RouteMetaAccess.always));

      final fromOther = RouteMeta.from(12345);
      expect(fromOther.access, equals(RouteMetaAccess.always));
    });

    test('export and toMap and toJson work correctly', () {
      final meta = RouteMeta.auth(title: 'Profile');

      final exported = meta.export();
      expect(exported['access'], equals(RouteMetaAccess.auth));
      expect(exported['title'], equals('Profile'));

      expect(meta.toMap(), equals(exported));
      expect(meta.toJson(), equals(exported));
    });

    test('copyWith works correctly', () {
      final meta = RouteMeta.nonAuth(title: 'Home');
      final updated = meta.copyWith(
        access: RouteMetaAccess.auth,
        title: 'Home Secured',
      );

      expect(updated.access, equals(RouteMetaAccess.auth));
      expect(updated.title, equals('Home Secured'));
    });

    test('works as MapView in GoRoute metadata parameter', () {
      final routeMeta = RouteMeta.auth(title: 'Secure Area');
      final route = GoRoute(
        path: '/secure',
        builder: (context, state) => const SizedBox(),
        metadata: routeMeta,
      );

      expect(route.metadata, isA<RouteMeta>());
      final parsed = RouteMeta.from(route.metadata);
      expect(parsed.access, equals(RouteMetaAccess.auth));
      expect(parsed.title, equals('Secure Area'));
    });

    test('appRoutes configure routes with RouteMeta correctly', () {
      expect(appRoutes.length, greaterThanOrEqualTo(3));
      final homeRoute = appRoutes[0] as GoRoute;
      expect(homeRoute.metadata, isA<RouteMeta>());
      final homeMeta = homeRoute.metadata as RouteMeta;
      expect(homeMeta.access, equals(RouteMetaAccess.always));

      final authRoute = appRoutes[1] as GoRoute;
      expect(authRoute.metadata, isA<RouteMeta>());
      final authMeta = authRoute.metadata as RouteMeta;
      expect(authMeta.access, equals(RouteMetaAccess.nonAuth));

      final accountRoute = appRoutes[2] as GoRoute;
      expect(accountRoute.metadata, isA<RouteMeta>());
      final accountMeta = accountRoute.metadata as RouteMeta;
      expect(accountMeta.access, equals(RouteMetaAccess.auth));
    });
  });
}

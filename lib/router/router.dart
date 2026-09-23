import 'dart:async';

import 'package:app/router/route_meta.dart';
import 'package:app/router/routes.dart';
import 'package:app/user/auth_state.dart';
import 'package:app/user/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class Router {
  late final GoRouter instance;

  Future<void> boot() async {
    instance = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: appRoutes,
      onEnter:
          (
            BuildContext context,
            GoRouterState currentState,
            GoRouterState nextState,
            GoRouter goRouter,
          ) {
            return Allow();
          },
      refreshListenable: AuthState.userMate,
      redirect: (context, state) async {
        final meta = RouteMeta.from(state.metadata);
        final bool authS = AuthState.userMate.value != null;
        final bool authT = meta.access == RouteMetaAccess.auth;



        if (authT && !authS) {
          return routePathUserAuth;
        }

        return null;
      },
    );
  }
}

import 'package:app/user/pages/page_after_login.dart';
import 'package:app/user/pages/page_auth.dart';
import 'package:app/pages/page_home.dart';
import 'package:app/user/const.dart';
import 'package:app/user/pages/page_logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  onEnter:
      (
        BuildContext context,
        GoRouterState currentState,
        GoRouterState nextState,
        GoRouter goRouter,
      ) async {
        return const Allow();
      },
  routes: [
    GoRoute(path: '/', builder: (context, state) => PageHome()),
    GoRoute(path: routePathUserAuth, builder: (context, state) => PageAuth()),
    GoRoute(
      path: routePathUserLogout,
      builder: (context, state) => PageLogout(),
    ),
    GoRoute(
      path: routePathUserAfterLogin,
      builder: (context, state) => PageAfterLogin(),
    ),
  ],
);

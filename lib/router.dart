import 'package:app/pages/page_home.dart';
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
  routes: [GoRoute(path: '/', builder: (context, state) => PageHome())],
);

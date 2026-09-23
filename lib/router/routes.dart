import 'package:app/router/route_meta.dart';
import 'package:app/user/const.dart';
import 'package:app/user/pages/page_user_account.dart';
import 'package:app/user/pages/page_user_auth.dart';
import 'package:go_router/go_router.dart';

import '../pages/page_home.dart';

final List<RouteBase> appRoutes = [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => NoTransitionPage(child: PageHome()),
    metadata: RouteMeta(access: RouteMetaAccess.always),
  ),
  GoRoute(
    path: routePathUserAuth,
    pageBuilder: (ctx, state) => NoTransitionPage(child: PageUserAuth()),
    metadata: RouteMeta(access: RouteMetaAccess.nonAuth),
  ),
  GoRoute(
    path: routePathUserAccount,
    pageBuilder: (context, state) => NoTransitionPage(child: PageUserAccount()),
    metadata: RouteMeta(access: RouteMetaAccess.auth),
  ),
];

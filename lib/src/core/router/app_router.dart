import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdphotomap/src/features/login/presentation/page/login.dart';

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',

    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Login();
        },
      ),
      GoRoute(
        path: '/welcome',
        builder: (_, __) {
          return const Welcome();
        },
      )
    ],
  );
}

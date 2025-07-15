import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdphotomap/src/core/router/listener.dart';
import 'package:jdphotomap/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:jdphotomap/src/features/home/presentation/page/home.dart';
import 'package:jdphotomap/src/features/loading/presentation/page/loading_page.dart';
import 'package:jdphotomap/src/features/login/presentation/page/login.dart';
import 'package:jdphotomap/src/features/profile_photographer/presentation/page/photographer_profile.dart';
import 'package:jdphotomap/src/features/signup/presentation/page/signup.dart';
import 'package:jdphotomap/src/features/welcome/presentation/page/welcome.dart';
import 'package:jdphotomap/src/injection/injection.dart';

class AppRouter {
  final AppCubit _appCubit = sl<AppCubit>();
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: GoListener(stream: _appCubit.stream),
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      final AppStatus status = _appCubit.state.status;
      final String currentLocation = state.matchedLocation;
      const List<String> publicRoutes = <String>['/login', '/signup'];
      if (status == AppStatus.unauthenticated &&
          !publicRoutes.contains(currentLocation)) {
        return '/welcome';
      }
      if (status == AppStatus.authenticated &&
          <String>[
            '/welcome',
            '/login',
            '/',
            '/signup',
          ].contains(currentLocation)) {
        return '/home';
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (_, _) => const LoadingPage()),

      GoRoute(
        path: '/welcome',
        builder: (_, _) {
          return const Welcome();
        },
      ),
      // Login
      GoRoute(path: '/login', builder: (_, _) => const Login()),
      GoRoute(path: '/signup', builder: (_, _) => const Signup()),
      GoRoute(path: '/home', builder: (_, _) => const Home()),
      GoRoute(
        path: '/myProfile',
        builder: (_, _) => const PhotographerProfile(),
      ),
    ],
  );
}

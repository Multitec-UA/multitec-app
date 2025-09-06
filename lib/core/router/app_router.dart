import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/router/scaffold_with_nested_navigation.dart';
import 'package:multitec_app/core/ui/screens/not_found_screen.dart';
import 'package:multitec_app/features/activities/presentation/activities_screen.dart';
import 'package:multitec_app/features/auth/domain/enums/autentication_status.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/features/auth/presentation/screens/login_screen.dart';
import 'package:multitec_app/features/example/presentation/screens/example_screen.dart';
import 'package:multitec_app/features/home/presentation/screens/home_screen.dart';
import 'package:multitec_app/features/map/presentation/map_screen.dart';
import 'package:multitec_app/features/user/presentation/screens/profile_screen.dart';
import 'package:multitec_app/features/splash/presentation/splash_sreen.dart';

enum AppRoute {
  login('/login'),
  splash('/splash'),
  home('/home'),
  activities('/activities'),
  map('/map'),
  profile('/profile'),
  example('/example');

  const AppRoute(this.path);
  final String path;
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Home');
final GlobalKey<NavigatorState> _shellNavigatorActivitiesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Activities');
final GlobalKey<NavigatorState> _shellNavigatorMapKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Map');
final GlobalKey<NavigatorState> _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Profile');

final authService = locator<AuthService>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoute.login.path,
  redirect: (context, state) {
    final path = state.matchedLocation;
    switch (authService.status) {
      case AuthenticationStatus.unauthenticated:
        return path == AppRoute.login.path ? null : AppRoute.login.path;

      case AuthenticationStatus.authenticated:
        if (path == AppRoute.login.path) return AppRoute.home.path;
        return null;

      case AuthenticationStatus.unknown:
        return AppRoute.login.path;
    }
  },
  routes: [
    GoRoute(
      name: AppRoute.login.name,
      path: AppRoute.login.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: AppRoute.splash.name,
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, __, shell) =>
          ScaffoldWithNestedNavigation(navigationShell: shell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              name: AppRoute.home.name,
              path: AppRoute.home.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorHomeKey,
                  path: AppRoute.example.path,
                  name: AppRoute.example.name,
                  builder: (context, state) => const ExampleScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorActivitiesKey,
          routes: [
            GoRoute(
              name: AppRoute.activities.name,
              path: AppRoute.activities.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ActivitiesScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMapKey,
          routes: [
            GoRoute(
              name: AppRoute.map.name,
              path: AppRoute.map.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MapScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              name: AppRoute.profile.name,
              path: AppRoute.profile.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

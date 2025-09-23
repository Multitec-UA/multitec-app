import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/router/scaffold_with_nested_navigation.dart';
import 'package:multitec_app/core/ui/screens/not_found_screen.dart';
import 'package:multitec_app/features/auth/domain/enums/autentication_status.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:multitec_app/features/example/presentation/screens/example_screen.dart';
import 'package:multitec_app/features/home/presentation/screens/home_screen.dart';
import 'package:multitec_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/presentation/screens/joined_schedules_screen.dart';
import 'package:multitec_app/features/schedule/presentation/screens/schedule_detail_screen.dart';
import 'package:multitec_app/features/schedule/presentation/screens/schedule_screen.dart';
import 'package:multitec_app/features/settings/presentation/screens/help_and_feedback_screen.dart';
import 'package:multitec_app/features/settings/presentation/screens/settings_screen.dart';

enum AppRoute {
  login('/login'),
  home('/home'),
  schedule('/schedule'),
  scheduleDetail('/detail'),
  joinedSchedules('/joinedschedules'),
  profile('/profile'),
  settings('/settings'),
  helpAndFeedback('/help-feedback'),
  example('/example');

  const AppRoute(this.path);
  final String path;
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Home');
final GlobalKey<NavigatorState> _shellNavigatorActivitiesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Activities');
final GlobalKey<NavigatorState> _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Profile');

final authService = locator<AuthService>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoute.login.path,
  refreshListenable: authService.statusListenable,
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
      builder: (context, state) => const SignInScreen(),
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
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomeScreen()),
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
              name: AppRoute.schedule.name,
              path: AppRoute.schedule.path,
              pageBuilder: (context, state) => NoTransitionPage(
                key: ValueKey(
                  'schedule-${(state.extra as ScheduleType?)?.name ?? 'default'}',
                ),
                child: ScheduleScreen(initialTab: state.extra as ScheduleType?),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorActivitiesKey,
                  path: AppRoute.scheduleDetail.path,
                  name: AppRoute.scheduleDetail.name,
                  builder: (context, state) {
                    final item = state.extra as ScheduleItem?;
                    if (item != null) {
                      return ScheduleDetailScreen(item: item);
                    }
                    return const NotFoundScreen();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              name: AppRoute.profile.name,
              path: AppRoute.profile.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfileScreen()),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorProfileKey,
                  path: AppRoute.joinedSchedules.path,
                  name: AppRoute.joinedSchedules.name,
                  builder: (context, state) => const JoinedSchedulesScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: AppRoute.settings.path,
                  name: AppRoute.settings.name,
                  builder: (context, state) => const SettingsScreen(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: AppRoute.helpAndFeedback.path,
                      name: AppRoute.helpAndFeedback.name,
                      builder: (context, state) =>
                          const HelpAndFeedbackScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

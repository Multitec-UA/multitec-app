import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sq1_assignment/core/ui/screens/not_found_screen.dart';
import 'package:sq1_assignment/feature/home/presentation/screens/home_screen.dart';

enum AppRoute {
  home('/');

  const AppRoute(this.path);
  final String path;
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/core/router/app_routes.dart';
import 'package:supa_task/domain/models/app_user.dart';
import 'package:supa_task/domain/models/task.dart';
import 'package:supa_task/domain/repository/user/notifiers/user_notifier.dart';
import 'package:supa_task/ui/404/error_page.dart';
import 'package:supa_task/ui/add_task/add_task_page.dart';
import 'package:supa_task/ui/home/home_page.dart';
import 'package:supa_task/ui/login/login_page.dart';
import 'package:supa_task/ui/signup/signup_page.dart';
import 'package:supa_task/ui/splash/splash_page.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final userValueNotifier = ValueNotifier<AppUser?>(ref.read(userProvider));

  ref.listen<AppUser?>(userProvider, (prev, next) {
    userValueNotifier.value = next;
  });

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    errorBuilder: (context, state) => ErrorPage(),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.splash,
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoutes.login,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: AppRoutes.signup,
        builder: (_, __) => const SignupPage(),
      ),
      GoRoute(
        path: '/home',
        name: AppRoutes.home,
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: '/upsert-task',
        name: AppRoutes.upsertTask,
        builder: (_, state) {
          final task = state.extra as Task?;
          return AddTaskPage(task: task);
        },
      ),
    ],
    refreshListenable: userValueNotifier,
    redirect: (context, state) {
      final user = userValueNotifier.value;
      final isAuthenticated = user != null;
      final currentPath = state.matchedLocation;

      if (currentPath == '/') {
        return null;
      }

      if (!isAuthenticated && currentPath.startsWith('/home')) {
        return '/login';
      }

      if (isAuthenticated &&
          (currentPath == '/login' || currentPath == '/signup')) {
        return '/home';
      }

      return null;
    },
  );
}

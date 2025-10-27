import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/domain/repository/user/notifiers/user_notifier.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      final user = ref.read(userProvider);
      if (!mounted) return;
      if (user != null) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App title
            Text(
              'SupaTask',
              style: theme.textTheme.h2.copyWith(
                color: theme.colorScheme.foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            // Loading animation
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                'assets/icons/loading_circle.json',
                fit: BoxFit.contain,
                repeat: true,
                addRepaintBoundary: true,
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.color(
                      const ['**'],
                      value:
                          theme.brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

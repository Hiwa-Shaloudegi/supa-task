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
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await Future.wait([
        // Minimum splash duration
        Future.delayed(const Duration(seconds: 2)),
      ]);

      if (!mounted) return;

      final user = ref.read(userProvider);
      context.go(user != null ? '/home' : '/login');
    } catch (e) {
      if (!mounted) return;
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo.png', scale: 2),
                  Transform.translate(
                    offset: const Offset(0, -46),

                    child: Image.asset(
                      'assets/images/logo_text.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 44,
              child: Lottie.asset(
                'assets/icons/loading_circle.json',
                width: 120,
                height: 120,
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

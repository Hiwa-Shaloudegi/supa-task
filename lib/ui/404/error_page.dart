import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '404',
                  style: theme.textTheme.large.copyWith(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Page not found',
                  style: theme.textTheme.large.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                Text(
                  'The page you’re looking for doesn’t exist or has been moved.',
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                ShadButton(
                  size: ShadButtonSize.lg,
                  onPressed: () => context.go('/home'),
                  child: const Text('Go Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

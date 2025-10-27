import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supa_task/domain/repository/user/notifiers/user_notifier.dart';

class HeaderSection extends ConsumerWidget {
  const HeaderSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final appUser = ref.watch(userProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback:
              (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF0B69B6),
                  Color(0xFF7674F5),
                  Color(0xFF8A2BE2),
                  Color(0xFFBA55D3),
                  Color(0xFF6A5ACD),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
          child: Text(
            (appUser != null && appUser.name != null)
                ? 'Welcome ${appUser.name},'
                : 'Hello There,',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Let's get things done today 🚀",
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }
}

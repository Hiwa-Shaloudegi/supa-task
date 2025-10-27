import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/widgets/buttons/google_auth_button.dart';
import 'package:supa_task/domain/repository/user/command/google_signin_command.dart';

class OAuthSection extends ConsumerWidget {
  const OAuthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        // Divider
        Row(
          children: [
            Expanded(child: Divider(color: theme.colorScheme.border)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("or"),
            ),
            Expanded(child: Divider(color: theme.colorScheme.border)),
          ],
        ),
        const SizedBox(height: 16),

        // Social buttons
        GoogleAuthButton(
          isLoading: ref.watch(googleSigninCommandProvider).isLoading,
          onPressed: () async {
            await ref.read(googleSigninCommandProvider.notifier).run();
          },
        ),
        const SizedBox(height: 12),

        //TODO: add sign in with Apple
        //AppleAuthButton(),
      ],
    );
  }
}

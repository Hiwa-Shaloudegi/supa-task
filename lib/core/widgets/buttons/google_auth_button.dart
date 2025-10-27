import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/widgets/loading/loading_widget.dart';

class GoogleAuthButton extends ConsumerWidget {
  const GoogleAuthButton({super.key, this.isLoading = false, this.onPressed});
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);

    return ShadButton.outline(
      width: double.infinity,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? LoadingWidget(
                color: theme.colorScheme.secondaryForeground,
                dimension: 14,
              )
              : FaIcon(FontAwesomeIcons.google),
          SizedBox(width: 8),
          Text("Continue with Google"),
        ],
      ),
    );
  }
}

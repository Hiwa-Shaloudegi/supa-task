import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/domain/repository/theme/notifiers/theme_mode_notifier.dart';

class ThemeSwich extends ConsumerWidget {
  const ThemeSwich({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.light_mode, size: 20),
        SizedBox(width: 8),
        ShadSwitch(
          value:
              ref.watch(themeModeProvider) == ThemeMode.dark ||
              (ref.watch(themeModeProvider) == null &&
                  MediaQuery.of(context).platformBrightness == Brightness.dark),
          height: 19,
          width: 42,
        ),
        SizedBox(width: 8),
        Icon(Icons.dark_mode, size: 20),
      ],
    );
  }
}

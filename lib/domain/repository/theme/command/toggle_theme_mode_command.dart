import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/theme/theme_repository.dart';

part 'toggle_theme_mode_command.g.dart';

@riverpod
class ToggleThemeModeCommand extends _$ToggleThemeModeCommand {
  @override
  void build() {}

  run(ThemeMode newThemeMode) {
    ref.read(themeRepositoryProvider).changeThemeMode(newThemeMode);
  }
}

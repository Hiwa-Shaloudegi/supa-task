import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/data/local/theme/theme_local_service.dart';
import 'package:supa_task/domain/repository/theme/notifiers/theme_mode_notifier.dart';

part 'theme_repository.g.dart';

@Riverpod(keepAlive: true)
ThemeRepository themeRepository(Ref ref) => ThemeRepository(
  themeModeNotifier: ref.read(themeModeProvider.notifier),
  themeLocalService: ref.read(themeLocalServiceProvider),
);

class ThemeRepository {
  final ThemeLocalService _themeLocalService;

  // notifiers (variables)
  final ThemeModeNotifier _themeModeNotifier;

  ThemeRepository({
    required ThemeLocalService themeLocalService,
    required ThemeModeNotifier themeModeNotifier,
  }) : _themeLocalService = themeLocalService,
       _themeModeNotifier = themeModeNotifier;

  void changeThemeMode(ThemeMode newThemeMode) {
    _themeLocalService.saveTheme(newThemeMode.name);
    _themeModeNotifier.setData(newThemeMode);
  }

  ThemeMode? getThemeMode() {
    final themeMode = _themeLocalService.getTheme();
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/theme/theme_repository.dart';

part 'theme_mode_notifier.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode? build() {
    return ref.read(themeRepositoryProvider).getThemeMode();
  }

  void setData(ThemeMode data) {
    state = data;
  }
}

// TODO: add thiis feature
// mixin NotifierUpdate<T> on $Notifier<T> {
//   void update(T Function(T state) cb) => state = cb(state);
// }

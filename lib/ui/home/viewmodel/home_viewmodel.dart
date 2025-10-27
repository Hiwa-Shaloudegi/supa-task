import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/task/command/switch_done_for_task_command.dart';
import 'package:supa_task/domain/repository/theme/command/toggle_theme_mode_command.dart';
import 'package:supa_task/domain/repository/user/command/logout_command.dart';
import 'package:supa_task/ui/home/viewmodel/home_uistate.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewmodel extends _$HomeViewmodel {
  @override
  HomeUistate build() {
    return HomeUistate();
  }

  Future<void> logout() async {
    await ref.read(logoutCommandProvider.notifier).run();
  }

  changeThemeMode(ThemeMode newThemeMode) {
    ref.watch(toggleThemeModeCommandProvider.notifier).run(newThemeMode);
  }

  switchDoneForTask(String taskId, bool isDone) async {
    await ref
        .read(switchDoneForTaskCommandProvider(taskId).notifier)
        .run(isDone);
  }
}

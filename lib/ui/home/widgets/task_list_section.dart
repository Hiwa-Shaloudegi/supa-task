import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supa_task/domain/repository/task/query/list_tasks_query.dart';
import 'package:supa_task/ui/home/widgets/tasks_data_state.dart';
import 'package:supa_task/ui/home/widgets/tasks_empty_state.dart';
import 'package:supa_task/ui/home/widgets/tasks_error_state.dart';
import 'package:supa_task/ui/home/widgets/tasks_loading_state.dart';

class TaskListSection extends ConsumerWidget {
  const TaskListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskAsync = ref.watch(listTasksQueryProvider);

    return taskAsync.when(
      data: (tasks) {
        if (tasks.isEmpty) {
          return TasksEmptyState();
        }
        return TasksDataState(tasks: tasks);
      },
      error:
          (error, _) =>
              ref.watch(listTasksQueryProvider).isRefreshing
                  ? TasksLoadingState()
                  : TaksErrorState(),
      loading: () => TasksLoadingState(),
    );
  }
}

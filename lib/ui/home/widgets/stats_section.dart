import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supa_task/domain/repository/task/query/list_tasks_query.dart';
import 'package:supa_task/ui/home/widgets/task_stat_cart.dart';

class StatsSection extends ConsumerWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(listTasksQueryProvider);

    return Row(
      children: [
        TaskStatCard(
          title: "Done",
          isLoading: tasksAsync.isLoading,

          count: tasksAsync.maybeWhen(
            data: (tasks) => tasks.where((t) => t.isCompleted == true).length,
            orElse: () => 0,
          ),
          color: Colors.green,
        ),
        const SizedBox(width: 12),
        TaskStatCard(
          title: "Left",
          isLoading: tasksAsync.isLoading,
          count: tasksAsync.maybeWhen(
            data: (tasks) => tasks.where((t) => t.isCompleted != true).length,
            orElse: () => 0,
          ),
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}

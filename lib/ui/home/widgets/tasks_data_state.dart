import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/router/app_routes.dart';
import 'package:supa_task/core/utils/extensions/async_value_ui.dart';
import 'package:supa_task/domain/models/task.dart';
import 'package:supa_task/domain/repository/task/command/delete_task_command.dart';
import 'package:supa_task/domain/repository/task/command/switch_done_for_task_command.dart';
import 'package:supa_task/ui/home/widgets/task_item.dart';

class TasksDataState extends StatelessWidget {
  const TasksDataState({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: tasks.length,
      itemBuilder: (_, index) {
        final task = tasks[index];

        return Consumer(
          builder: (_, ref, child) {
            ref.listen(
              switchDoneForTaskCommandProvider(task.id),
              (_, next) => next.showToastOnError(context, title: "Failed!"),
            );
            return Dismissible(
              key: Key(task.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                await ref
                    .read(deleteTaskCommandProvider(task.id).notifier)
                    .run();

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) {
                    ref
                        .read(deleteTaskCommandProvider(task.id))
                        .showToastOnError(
                          context,
                          title: "Couldn't delete task",
                        );
                  }
                });
              },
              confirmDismiss: (direction) async {
                await ref
                    .read(deleteTaskCommandProvider(task.id).notifier)
                    .run();

                final state = ref.read(deleteTaskCommandProvider(task.id));

                final hasError = state.hasError;
                if (hasError) {
                  // Show toast immediately while widget is still mounted
                  if (context.mounted) {
                    state.showToastOnError(
                      context,
                      title: "Couldn't delete task",
                    );
                  }
                }

                return !hasError;
              },
              background: Container(
                color: Colors.red[600],
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: const Icon(LucideIcons.trash, color: Colors.white),
              ),
              child: TaskItem(
                task: task,
                onToggle: (value) async {
                  await ref
                      .read(switchDoneForTaskCommandProvider(task.id).notifier)
                      .run(value!);

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context.mounted) {
                      ref
                          .read(switchDoneForTaskCommandProvider(task.id))
                          .showToastOnError(context, title: "Failed!");
                    }
                  });
                },
                onTap: () {
                  context.pushNamed(AppRoutes.upsertTask, extra: task);
                },
              ),
            );
          },
        );
      },
    );
  }
}

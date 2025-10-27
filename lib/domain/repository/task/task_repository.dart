import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/data/api/task/task_api_service.dart';
import 'package:supa_task/domain/models/task.dart';
import 'package:supa_task/domain/repository/task/query/list_tasks_query.dart';

part 'task_repository.g.dart';

@Riverpod(keepAlive: true)
TaskRepository taskRepository(Ref ref) {
  return TaskRepository(ref, taskApiService: ref.read(taskApiServiceProvider));
}

class TaskRepository {
  final TaskApiService taskApiService;
  final Ref ref;

  TaskRepository(this.ref, {required this.taskApiService});

  Future<List<Task>> fetchTasks() async {
    return await taskApiService.fetchTasks();
  }

  Future<Task> addTask(String title, String? description) async {
    final newTask = await taskApiService.createTask(title, description);

    final tasksAsync = ref.read(listTasksQueryProvider);

    tasksAsync.whenData((tasks) {
      final updatedTasks = [newTask, ...tasks];
      ref
          .read(listTasksQueryProvider.notifier)
          .setState(AsyncData(updatedTasks));
    });

    return newTask;
  }

  Future<void> switchDoneStatusForTask(String id, bool isDone) async {
    final tasksAsync = ref.read(listTasksQueryProvider);
    final previousState = tasksAsync;
    try {
      tasksAsync.whenData((tasks) {
        final updatedTasks =
            tasks.map((e) {
              if (e.id != id) {
                return e;
              } else {
                return e.copyWith(isCompleted: isDone);
              }
            }).toList();

        ref
            .read(listTasksQueryProvider.notifier)
            .setState(AsyncData(updatedTasks));
      });

      await taskApiService.updateDoneStatusTask(id, isDone);
    } catch (e) {
      ref.read(listTasksQueryProvider.notifier).setState(previousState);
      rethrow;
    }
  }

  Future<void> updateTask(String id, String? title, String? description) async {
    final updatedTask = await taskApiService.updateTask(id, title, description);

    final tasksAsync = ref.read(listTasksQueryProvider);

    tasksAsync.whenData((tasks) {
      final updatedTasks =
          tasks.map((task) {
            if (task.id == id) {
              return updatedTask;
            }
            return task;
          }).toList();

      ref
          .read(listTasksQueryProvider.notifier)
          .setState(AsyncData(updatedTasks));
    });
  }

  Future<void> deleteTask(String taskId) async {
    final tasksAsync = ref.read(listTasksQueryProvider);
    final previousState = tasksAsync;

    try {
      tasksAsync.whenData((tasks) {
        final updatedTasks = tasks.where((task) => task.id != taskId).toList();
        ref
            .read(listTasksQueryProvider.notifier)
            .setState(AsyncData(updatedTasks));
      });

      await taskApiService.deleteTask(taskId);
    } catch (e) {
      ref.read(listTasksQueryProvider.notifier).setState(previousState);
      rethrow;
    }
  }
}

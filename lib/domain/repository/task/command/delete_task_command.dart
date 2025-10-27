import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/task/task_repository.dart';

part 'delete_task_command.g.dart';

@Riverpod()
class DeleteTaskCommand extends _$DeleteTaskCommand {
  @override
  FutureOr<void> build(String taskId) {}

  run() async {
    final link = ref.keepAlive();

    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(taskRepositoryProvider).deleteTask(taskId),
    );
    link.close();
  }
}

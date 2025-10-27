import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/task/task_repository.dart';

part 'switch_done_for_task_command.g.dart';

@Riverpod()
class SwitchDoneForTaskCommand extends _$SwitchDoneForTaskCommand {
  @override
  FutureOr<void> build(String taskId) {}

  run(bool isDone) async {
    final link = ref.keepAlive();

    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref
          .read(taskRepositoryProvider)
          .switchDoneStatusForTask(taskId, isDone),
    );
    link.close();
  }
}

//****************************/

// @riverpod
// Future<void> switchDoneForTask(Ref ref, String taskId, bool isDone) async {
//   final repo = ref.read(taskRepositoryProvider);
//   await repo.switchDoneStatusForTask(taskId, isDone);
// }

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/task/task_repository.dart';

part 'add_task_command.g.dart';

@riverpod
class AddTaskCommand extends _$AddTaskCommand {
  @override
  FutureOr<void> build() {}

  run(String title, String? description) async {
    final link = ref.keepAlive();

    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(taskRepositoryProvider).addTask(title, description),
    );
    link.close();
  }
}

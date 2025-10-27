import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/task/task_repository.dart';

part 'update_task_command.g.dart';

@riverpod
class UpdateTaskCommand extends _$UpdateTaskCommand {
  @override
  FutureOr<void> build() {}

  run(String id, String title, String? description) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(taskRepositoryProvider).updateTask(id, title, description),
    );
    link.close();
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/user/user_repository.dart';

part 'logout_command.g.dart';

@Riverpod()
class LogoutCommand extends _$LogoutCommand {
  @override
  FutureOr<void> build() {}

  run() async {
    final link = ref.keepAlive();

    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(userRepositoryProvider).logout(),
    );
    link.close();
  }
}

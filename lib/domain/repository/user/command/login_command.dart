import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/user/user_repository.dart';

part 'login_command.g.dart';

@Riverpod()
class LoginCommand extends _$LoginCommand {
  @override
  FutureOr<void> build() {}

  Future<void> run(String email, String password) async {
    final link = ref.keepAlive();

    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(userRepositoryProvider).login(email, password),
    );
    link.close();
  }
}

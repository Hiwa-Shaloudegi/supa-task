import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/user/user_repository.dart';

part 'signup_command.g.dart';

@Riverpod()
class SignupCommand extends _$SignupCommand {
  @override
  FutureOr<void> build() {}

  Future<void> run(String email, String password, String name) async {
    final link = ref.keepAlive();

    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(userRepositoryProvider).signup(email, password, name),
    );
    link.close();
  }
}

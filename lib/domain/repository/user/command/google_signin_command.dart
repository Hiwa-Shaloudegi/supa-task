import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/user/user_repository.dart';

part 'google_signin_command.g.dart';

@riverpod
class GoogleSigninCommand extends _$GoogleSigninCommand {
  @override
  FutureOr<void> build() {}

  run() async {
    final link = ref.keepAlive();
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(userRepositoryProvider).googleSignIn(),
    );
    link.close();
  }
}

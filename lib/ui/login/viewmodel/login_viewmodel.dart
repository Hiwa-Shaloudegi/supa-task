import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/user/command/login_command.dart';
import 'package:supa_task/ui/login/viewmodel/login_uistate.dart';

part 'login_viewmodel.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginUiState build() {
    return LoginUiState();
  }

  togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  login(String email, String password) async {
    return await ref.read(loginCommandProvider.notifier).run(email, password);
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/repository/user/command/signup_command.dart';
import 'package:supa_task/ui/signup/viewmodel/signup_uistate.dart';

part 'signup_viewmodel.g.dart';

@riverpod
class SignupViewmodel extends _$SignupViewmodel {
  @override
  SignupUiState build() {
    return SignupUiState();
  }

  togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  signup(String email, String password, String name) async {
    return await ref
        .read(signupCommandProvider.notifier)
        .run(email, password, name);
  }
}

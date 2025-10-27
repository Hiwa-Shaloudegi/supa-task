class LoginUiState {
  final bool isPasswordVisible;

  LoginUiState({this.isPasswordVisible = false});

  copyWith({bool? isPasswordVisible}) {
    return LoginUiState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

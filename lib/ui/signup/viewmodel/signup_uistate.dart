class SignupUiState {
  final bool isPasswordVisible;
  SignupUiState({this.isPasswordVisible = false});

  copyWith({bool? isPasswordVisible}) {
    return SignupUiState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

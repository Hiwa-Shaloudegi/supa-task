// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignupViewmodel)
const signupViewmodelProvider = SignupViewmodelProvider._();

final class SignupViewmodelProvider
    extends $NotifierProvider<SignupViewmodel, SignupUiState> {
  const SignupViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signupViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signupViewmodelHash();

  @$internal
  @override
  SignupViewmodel create() => SignupViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupUiState>(value),
    );
  }
}

String _$signupViewmodelHash() => r'd605e9edfbdb17ebfc6e95fffa937cf1d010d20b';

abstract class _$SignupViewmodel extends $Notifier<SignupUiState> {
  SignupUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignupUiState, SignupUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignupUiState, SignupUiState>,
              SignupUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

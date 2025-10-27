// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_signin_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GoogleSigninCommand)
const googleSigninCommandProvider = GoogleSigninCommandProvider._();

final class GoogleSigninCommandProvider
    extends $AsyncNotifierProvider<GoogleSigninCommand, void> {
  const GoogleSigninCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSigninCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSigninCommandHash();

  @$internal
  @override
  GoogleSigninCommand create() => GoogleSigninCommand();
}

String _$googleSigninCommandHash() =>
    r'62f0f39d93f32d0d1c954dad08160e66c78e982b';

abstract class _$GoogleSigninCommand extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

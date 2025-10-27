// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SplashViewmodel)
const splashViewmodelProvider = SplashViewmodelProvider._();

final class SplashViewmodelProvider
    extends $NotifierProvider<SplashViewmodel, SplashUiState> {
  const SplashViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashViewmodelHash();

  @$internal
  @override
  SplashViewmodel create() => SplashViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashUiState>(value),
    );
  }
}

String _$splashViewmodelHash() => r'8a6fc9932b2069a2313029c22e4f75c32aaebec4';

abstract class _$SplashViewmodel extends $Notifier<SplashUiState> {
  SplashUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SplashUiState, SplashUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SplashUiState, SplashUiState>,
              SplashUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

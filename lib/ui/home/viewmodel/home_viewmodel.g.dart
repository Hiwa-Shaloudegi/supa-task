// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewmodel)
const homeViewmodelProvider = HomeViewmodelProvider._();

final class HomeViewmodelProvider
    extends $NotifierProvider<HomeViewmodel, HomeUistate> {
  const HomeViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewmodelHash();

  @$internal
  @override
  HomeViewmodel create() => HomeViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeUistate value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeUistate>(value),
    );
  }
}

String _$homeViewmodelHash() => r'870beed52c1d27d15155e4f91f8be8ce6b449188';

abstract class _$HomeViewmodel extends $Notifier<HomeUistate> {
  HomeUistate build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeUistate, HomeUistate>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeUistate, HomeUistate>,
              HomeUistate,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

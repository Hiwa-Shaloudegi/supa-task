// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeModeNotifier)
const themeModeProvider = ThemeModeNotifierProvider._();

final class ThemeModeNotifierProvider
    extends $NotifierProvider<ThemeModeNotifier, ThemeMode?> {
  const ThemeModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeNotifierHash();

  @$internal
  @override
  ThemeModeNotifier create() => ThemeModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode?>(value),
    );
  }
}

String _$themeModeNotifierHash() => r'103b94467aea3b5721fd86fc33bfcbaa0d061456';

abstract class _$ThemeModeNotifier extends $Notifier<ThemeMode?> {
  ThemeMode? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode?, ThemeMode?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode?, ThemeMode?>,
              ThemeMode?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_local_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeLocalService)
const themeLocalServiceProvider = ThemeLocalServiceProvider._();

final class ThemeLocalServiceProvider
    extends
        $FunctionalProvider<
          ThemeLocalService,
          ThemeLocalService,
          ThemeLocalService
        >
    with $Provider<ThemeLocalService> {
  const ThemeLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeLocalServiceHash();

  @$internal
  @override
  $ProviderElement<ThemeLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ThemeLocalService create(Ref ref) {
    return themeLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeLocalService>(value),
    );
  }
}

String _$themeLocalServiceHash() => r'2ec662e9e43e1d480e1f83a80d55645e8a225f66';

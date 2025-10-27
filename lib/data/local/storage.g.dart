// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storage)
const storageProvider = StorageProvider._();

final class StorageProvider
    extends $FunctionalProvider<NativeStorage, NativeStorage, NativeStorage>
    with $Provider<NativeStorage> {
  const StorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageHash();

  @$internal
  @override
  $ProviderElement<NativeStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NativeStorage create(Ref ref) {
    return storage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NativeStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NativeStorage>(value),
    );
  }
}

String _$storageHash() => r'83fc09a3cbe7103237216e1fe47ee8f0ae5366ea';

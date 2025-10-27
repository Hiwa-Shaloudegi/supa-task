// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(exceptionHandler)
const exceptionHandlerProvider = ExceptionHandlerProvider._();

final class ExceptionHandlerProvider
    extends
        $FunctionalProvider<
          ExceptionHandler,
          ExceptionHandler,
          ExceptionHandler
        >
    with $Provider<ExceptionHandler> {
  const ExceptionHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exceptionHandlerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exceptionHandlerHash();

  @$internal
  @override
  $ProviderElement<ExceptionHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ExceptionHandler create(Ref ref) {
    return exceptionHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExceptionHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExceptionHandler>(value),
    );
  }
}

String _$exceptionHandlerHash() => r'c2430cbd62b747936821ef53b20353276f034cb8';

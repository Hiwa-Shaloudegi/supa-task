// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_theme_mode_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ToggleThemeModeCommand)
const toggleThemeModeCommandProvider = ToggleThemeModeCommandProvider._();

final class ToggleThemeModeCommandProvider
    extends $NotifierProvider<ToggleThemeModeCommand, void> {
  const ToggleThemeModeCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleThemeModeCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleThemeModeCommandHash();

  @$internal
  @override
  ToggleThemeModeCommand create() => ToggleThemeModeCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$toggleThemeModeCommandHash() =>
    r'3316d210070ac4b3ccd64024a517d71448309b4d';

abstract class _$ToggleThemeModeCommand extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

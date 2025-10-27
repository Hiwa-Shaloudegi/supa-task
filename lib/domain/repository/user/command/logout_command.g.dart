// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogoutCommand)
const logoutCommandProvider = LogoutCommandProvider._();

final class LogoutCommandProvider
    extends $AsyncNotifierProvider<LogoutCommand, void> {
  const LogoutCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutCommandHash();

  @$internal
  @override
  LogoutCommand create() => LogoutCommand();
}

String _$logoutCommandHash() => r'f018025fe5c0af2a51a5ec57ba36a42bdd3e5752';

abstract class _$LogoutCommand extends $AsyncNotifier<void> {
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

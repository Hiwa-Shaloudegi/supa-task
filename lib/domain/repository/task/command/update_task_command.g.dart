// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpdateTaskCommand)
const updateTaskCommandProvider = UpdateTaskCommandProvider._();

final class UpdateTaskCommandProvider
    extends $AsyncNotifierProvider<UpdateTaskCommand, void> {
  const UpdateTaskCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateTaskCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateTaskCommandHash();

  @$internal
  @override
  UpdateTaskCommand create() => UpdateTaskCommand();
}

String _$updateTaskCommandHash() => r'42721e145567b84ff22025e8c650105c9c9a0714';

abstract class _$UpdateTaskCommand extends $AsyncNotifier<void> {
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

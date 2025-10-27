// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddTaskCommand)
const addTaskCommandProvider = AddTaskCommandProvider._();

final class AddTaskCommandProvider
    extends $AsyncNotifierProvider<AddTaskCommand, void> {
  const AddTaskCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addTaskCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addTaskCommandHash();

  @$internal
  @override
  AddTaskCommand create() => AddTaskCommand();
}

String _$addTaskCommandHash() => r'5e7c74b65cc863190ea365d62dc2ff514537e7b3';

abstract class _$AddTaskCommand extends $AsyncNotifier<void> {
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

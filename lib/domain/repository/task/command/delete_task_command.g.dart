// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_task_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeleteTaskCommand)
const deleteTaskCommandProvider = DeleteTaskCommandFamily._();

final class DeleteTaskCommandProvider
    extends $AsyncNotifierProvider<DeleteTaskCommand, void> {
  const DeleteTaskCommandProvider._({
    required DeleteTaskCommandFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deleteTaskCommandProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteTaskCommandHash();

  @override
  String toString() {
    return r'deleteTaskCommandProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DeleteTaskCommand create() => DeleteTaskCommand();

  @override
  bool operator ==(Object other) {
    return other is DeleteTaskCommandProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteTaskCommandHash() => r'a388d7449c66c11d099bc99d75df6340f0db4184';

final class DeleteTaskCommandFamily extends $Family
    with
        $ClassFamilyOverride<
          DeleteTaskCommand,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          String
        > {
  const DeleteTaskCommandFamily._()
    : super(
        retry: null,
        name: r'deleteTaskCommandProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteTaskCommandProvider call(String taskId) =>
      DeleteTaskCommandProvider._(argument: taskId, from: this);

  @override
  String toString() => r'deleteTaskCommandProvider';
}

abstract class _$DeleteTaskCommand extends $AsyncNotifier<void> {
  late final _$args = ref.$arg as String;
  String get taskId => _$args;

  FutureOr<void> build(String taskId);
  @$mustCallSuper
  @override
  void runBuild() {
    build(_$args);
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

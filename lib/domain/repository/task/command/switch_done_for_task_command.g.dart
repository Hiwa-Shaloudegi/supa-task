// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_done_for_task_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SwitchDoneForTaskCommand)
const switchDoneForTaskCommandProvider = SwitchDoneForTaskCommandFamily._();

final class SwitchDoneForTaskCommandProvider
    extends $AsyncNotifierProvider<SwitchDoneForTaskCommand, void> {
  const SwitchDoneForTaskCommandProvider._({
    required SwitchDoneForTaskCommandFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'switchDoneForTaskCommandProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$switchDoneForTaskCommandHash();

  @override
  String toString() {
    return r'switchDoneForTaskCommandProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SwitchDoneForTaskCommand create() => SwitchDoneForTaskCommand();

  @override
  bool operator ==(Object other) {
    return other is SwitchDoneForTaskCommandProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$switchDoneForTaskCommandHash() =>
    r'6d441e0a398eb1de8bfad6fd52a7f0cc8d5767fc';

final class SwitchDoneForTaskCommandFamily extends $Family
    with
        $ClassFamilyOverride<
          SwitchDoneForTaskCommand,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          String
        > {
  const SwitchDoneForTaskCommandFamily._()
    : super(
        retry: null,
        name: r'switchDoneForTaskCommandProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SwitchDoneForTaskCommandProvider call(String taskId) =>
      SwitchDoneForTaskCommandProvider._(argument: taskId, from: this);

  @override
  String toString() => r'switchDoneForTaskCommandProvider';
}

abstract class _$SwitchDoneForTaskCommand extends $AsyncNotifier<void> {
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

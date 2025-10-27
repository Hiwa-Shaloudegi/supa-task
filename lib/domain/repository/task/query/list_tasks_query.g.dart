// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_tasks_query.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListTasksQuery)
const listTasksQueryProvider = ListTasksQueryProvider._();

final class ListTasksQueryProvider
    extends $AsyncNotifierProvider<ListTasksQuery, List<Task>> {
  const ListTasksQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listTasksQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listTasksQueryHash();

  @$internal
  @override
  ListTasksQuery create() => ListTasksQuery();
}

String _$listTasksQueryHash() => r'7babb43b0947d06b5ad13624533c8e0021caf171';

abstract class _$ListTasksQuery extends $AsyncNotifier<List<Task>> {
  FutureOr<List<Task>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Task>>, List<Task>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Task>>, List<Task>>,
              AsyncValue<List<Task>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

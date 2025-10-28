import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/models/task.dart';
import 'package:supa_task/domain/repository/task/task_repository.dart';

part 'list_tasks_query.g.dart';

@riverpod
class ListTasksQuery extends _$ListTasksQuery {
  @override
  FutureOr<List<Task>> build() async {
    return await ref.read(taskRepositoryProvider).fetchTasks();
  }

  setState(AsyncValue<List<Task>> asyncValue) {
    if (ref.mounted) {
      state = asyncValue;
    }
  }
}

// TODO: is this a good idea?
// mixin Query<T> {
//   void setState(AsyncValue<T> asyncValue);
// }

// enum DataSourceType { remote, local }

// class Meta<T> {
//   final DataSourceType source;
//   final DateTime fetchTime;
//   final T data;

//   Meta._(this.data, this.source) : fetchTime = DateTime.now();

//   factory Meta.remote(T data) {
//     return Meta._(data, DataSourceType.remote);
//   }

//   factory Meta.local(T data) {
//     return Meta._(data, DataSourceType.local);
//   }
// }

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/core/exception/exception_handler.dart';
import 'package:supa_task/data/api/supabase_client.dart';
import 'package:supa_task/domain/models/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'task_api_service.g.dart';

@Riverpod(keepAlive: true)
TaskApiService taskApiService(Ref ref) {
  return TaskApiService(
    supabase: ref.read(supabaseProvider),
    handleException: ref.read(exceptionHandlerProvider),
  );
}

class TaskApiService {
  final SupabaseClient supabase;
  final ExceptionHandler handleException;
  final _table = 'task';

  TaskApiService({required this.supabase, required this.handleException});

  Future<List<Task>> fetchTasks() async {
    try {
      final data = await supabase
          .from(_table)
          .select()
          .order('created_at', ascending: false);

      final res = (data as List).map((e) => Task.fromJson(e)).toList();
      return res;
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<Task> createTask(String title, String? description) async {
    try {
      final res =
          await supabase.from(_table).insert({
            'title': title,
            'description': description,
          }).select();

      return Task.fromJson((res as List).first);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updateDoneStatusTask(String id, bool isDone) async {
    try {
      await supabase.from(_table).update({'is_completed': isDone}).eq('id', id);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<Task> updateTask(
    String id,
    String? newTitle,
    String? newDescription,
  ) async {
    try {
      final res =
          await supabase
              .from(_table)
              .update({'title': newTitle, 'description': newDescription})
              .eq('id', id)
              .select();

      return Task.fromJson((res as List).first);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await supabase.from(_table).delete().eq('id', taskId);
    } catch (e) {
      throw handleException(e);
    }
  }
}

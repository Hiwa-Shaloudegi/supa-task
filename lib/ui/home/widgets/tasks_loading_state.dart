import 'package:flutter/material.dart';
import 'package:supa_task/ui/home/widgets/task_item.dart';

class TasksLoadingState extends StatelessWidget {
  const TasksLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const TaskItem(isLoading: true),
    );
  }
}

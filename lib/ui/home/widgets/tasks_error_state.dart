import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/domain/repository/task/query/list_tasks_query.dart';

class TaksErrorState extends ConsumerWidget {
  const TaksErrorState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.triangleAlert,
                size: 64,
                color: theme.colorScheme.destructive,
              ),
              const SizedBox(height: 24),
              Text(
                'Something went wrong',
                style: theme.textTheme.h3.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "We couldn't load your tasks. Please check your connection and try again.",
                textAlign: TextAlign.center,
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
              const SizedBox(height: 24),
              ShadButton(
                onPressed: () => ref.refresh(listTasksQueryProvider),
                child: const Text('Try again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

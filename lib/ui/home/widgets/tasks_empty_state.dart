import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TasksEmptyState extends StatelessWidget {
  const TasksEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.checkCheck, // A clearer icon for "done"
                size: 80,
                color: theme.colorScheme.mutedForeground,
              ),
              const SizedBox(height: 24),
              Text(
                "No tasks yet",
                style: theme.textTheme.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Add a new task to stay productive.",
                textAlign: TextAlign.center,
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

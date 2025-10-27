import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TaskStatCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final bool isLoading;

  const TaskStatCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShadCard(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeletonizer(
              enabled: isLoading,
              child: Text(
                isLoading ? BoneMock.chars(2) : "$count",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:supa_task/domain/models/task.dart';
import 'package:timeago/timeago.dart' as timeago;

class TaskItem extends ConsumerWidget {
  final Task? task;
  final bool isLoading;
  final VoidCallback? onTap;
  final ValueChanged<bool?>? onToggle;
  final VoidCallback? onEdit;

  const TaskItem({
    super.key,
    this.task,
    this.isLoading = false,
    this.onTap,
    this.onToggle,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final isCompleted = task?.isCompleted ?? false;

    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: GestureDetector(
          onTap: isLoading ? null : onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: isLoading ? null : onTap,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: ShadCheckbox(
                        value: isCompleted,
                        onChanged: isLoading ? null : onToggle,
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  task?.title ?? 'No Title',
                                  style: theme.textTheme.list.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        isCompleted
                                            ? Colors.grey[400]
                                            : theme.colorScheme.foreground,
                                    decoration:
                                        isCompleted
                                            ? TextDecoration.lineThrough
                                            : null,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              ShadBadge.outline(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Text(
                                  task?.createdAt != null
                                      ? timeago.format(task!.createdAt!)
                                      : "unknown",
                                  style: theme.textTheme.small.copyWith(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              // if (!isLoading)
                              //   InkWell(
                              //     onTap: onEdit,
                              //     borderRadius: BorderRadius.circular(8),
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(4.0),
                              //       child: Icon(
                              //         Icons.edit,
                              //         size: 18,
                              //         color: theme.colorScheme.primary,
                              //       ),
                              //     ),
                              //   ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          // Description
                          if (task?.description?.isNotEmpty ?? false)
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                end: MediaQuery.sizeOf(context).width * 0.2,
                                bottom: 2,
                              ),
                              child: Text(
                                task!.description!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.small.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

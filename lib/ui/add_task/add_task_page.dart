import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/utils/extensions/async_value_ui.dart';
import 'package:supa_task/core/widgets/loading/loading_widget.dart';
import 'package:supa_task/domain/models/task.dart';
import 'package:supa_task/domain/repository/task/command/add_task_command.dart';
import 'package:supa_task/domain/repository/task/command/update_task_command.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  final Task? task;

  const AddTaskPage({super.key, this.task});

  @override
  ConsumerState<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<AddTaskPage> {
  final _formKey = GlobalKey<ShadFormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final task = widget.task;
    if (task != null) {
      _titleController.text = task.title!;
      _descriptionController.text = task.description ?? '';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;

    final theme = ShadTheme.of(context);

    ref.listen(addTaskCommandProvider, (_, next) {
      next.whenData((_) => context.pop());
      next.showToastOnError(context, title: "Adding Task Failed");
    });

    ref.listen(updateTaskCommandProvider, (_, next) {
      next.whenData((_) => context.pop());
      next.showToastOnError(context, title: "Updating Task Failed");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Task' : 'Add Task',
          style: theme.textTheme.large.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: ShadButton.ghost(
          child: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ShadForm(
            key: _formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  controller: _titleController,
                  label: const Text('Title'),
                  placeholder: const Text('Enter task title'),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                ShadInputFormField(
                  controller: _descriptionController,
                  label: const Text('Description'),
                  placeholder: const Text('Enter task description'),
                  maxLines: 5,
                  minLines: 3,
                ),
                const SizedBox(height: 24),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ShadButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (widget.task == null) {
                          // Add mode
                          await ref
                              .read(addTaskCommandProvider.notifier)
                              .run(
                                _titleController.text,
                                _descriptionController.text.isEmpty
                                    ? null
                                    : _descriptionController.text,
                              );
                        } else {
                          // Edit mode
                          await ref
                              .read(updateTaskCommandProvider.notifier)
                              .run(
                                widget.task!.id,
                                _titleController.text,
                                _descriptionController.text.isEmpty
                                    ? null
                                    : _descriptionController.text,
                              );
                        }
                      }
                    },
                    size: ShadButtonSize.lg,
                    child:
                        ref
                                .watch(
                                  isEditing
                                      ? updateTaskCommandProvider
                                      : addTaskCommandProvider,
                                )
                                .isLoading
                            ? const LoadingWidget()
                            : Text(isEditing ? 'Update Task' : 'Save Task'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

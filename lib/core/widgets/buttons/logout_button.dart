import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/widgets/loading/loading_widget.dart';
import 'package:supa_task/domain/repository/user/command/logout_command.dart';
import 'package:supa_task/ui/home/viewmodel/home_viewmodel.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ShadButton.ghost(
        width: double.infinity,
        onPressed: () async {
          if (context.mounted) {
            showDialog(
              context: context,
              builder:
                  (context) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ShadDialog(
                      title: const Text("Logout"),
                      description: const Text(
                        "Are you sure you want to logout?",
                      ),
                      actions: [
                        ShadButton.outline(
                          onPressed: () => context.pop(),
                          child: const Text("Cancel"),
                        ),
                        ShadButton(
                          onPressed: () async {
                            await ref
                                .read(homeViewmodelProvider.notifier)
                                .logout();
                          },
                          child: Consumer(
                            builder: (context, dialogRef, child) {
                              return dialogRef
                                  .watch(logoutCommandProvider)
                                  .maybeWhen(
                                    loading: () => LoadingWidget(),
                                    orElse: () => Text("Logout"),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, size: 18, color: Colors.redAccent),
            const SizedBox(width: 8),
            Text("Logout", style: TextStyle(color: Colors.redAccent)),
          ],
        ),
      ),
    );
  }
}

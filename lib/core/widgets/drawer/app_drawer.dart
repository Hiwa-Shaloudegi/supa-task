import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/widgets/buttons/logout_button.dart';
import 'package:supa_task/core/widgets/drawer/drawer_item.dart';
import 'package:supa_task/core/widgets/drawer/theme_swich.dart';
import 'package:supa_task/core/widgets/logo_widget.dart';
import 'package:supa_task/domain/repository/theme/notifiers/theme_mode_notifier.dart';
import 'package:supa_task/ui/home/viewmodel/home_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Drawer header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoWidget(),
                  const SizedBox(height: 12),
                  Text("Supa Task", style: theme.textTheme.h3),
                  const SizedBox(height: 4),
                  Text("Manage your tasks", style: theme.textTheme.muted),
                ],
              ),
            ),
            const Divider(),

            // Drawer items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                children: [
                  DrawerItem(
                    title: 'Theme Mode',
                    trailing: ThemeSwich(),
                    onTap: () {
                      // Get current theme state
                      final currentTheme = ref.read(themeModeProvider);
                      final isDark =
                          currentTheme == ThemeMode.dark ||
                          (currentTheme == null &&
                              MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark);

                      ref
                          .read(homeViewmodelProvider.notifier)
                          .changeThemeMode(
                            isDark ? ThemeMode.light : ThemeMode.dark,
                          );
                    },
                  ),
                  const Divider(indent: 6, endIndent: 6),
                  DrawerItem(
                    title: 'GitHub',
                    onTap: () async {
                      final repoUrl =
                          "https://github.com/Hiwa-Shaloudegi/supa-task";
                      final uri = Uri.parse(repoUrl);
                      if (!await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      )) {
                        // throw Exception('Could not launch $repoUrl');
                      }
                    },
                    trailing: FaIcon(FontAwesomeIcons.github, size: 20),
                  ),
                  const Divider(indent: 6, endIndent: 6),
                ],
              ),
            ),

            LogoutButton(),
          ],
        ),
      ),
    );
  }
}

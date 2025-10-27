import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    this.trailing,
    required this.onTap,
  });

  final String title;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
          onTap: onTap,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(title, style: theme.textTheme.p),
                ],
              ),
              trailing ?? const SizedBox.shrink(),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

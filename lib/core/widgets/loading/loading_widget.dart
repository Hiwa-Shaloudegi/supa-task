import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color, this.dimension});

  final Color? color;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SizedBox.square(
      dimension: dimension ?? 18,
      child: CircularProgressIndicator(
        color: color ?? theme.colorScheme.primaryForeground,
        strokeWidth: 3,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/exception/api_exception.dart';

extension AsyncValueUI on AsyncValue<void> {
  void showToastOnError(
    BuildContext context, {
    required String title,
    Color? backgroundColor,
  }) {
    if (!hasError) return;

    when(
      data: (_) {},
      loading: () {},
      error: (error, _) {
        if (!context.mounted) {
          return;
        }

        final String errorMessage;
        if (error is AppException) {
          errorMessage = error.message;
        } else {
          errorMessage = error.toString();
        }

        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: Text(title),
            description: Text(errorMessage),
            alignment: Alignment.topCenter,
            backgroundColor: backgroundColor ?? Colors.red,
            padding: const EdgeInsets.all(12),
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
  }
}

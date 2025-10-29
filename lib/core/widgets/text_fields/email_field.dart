import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadEmailField extends StatelessWidget {
  const ShadEmailField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      id: 'email',
      controller: controller,
      textInputAction: TextInputAction.next,
      label: const Text("Email"),
      placeholder: const Text("you@example.com"),
      keyboardType: TextInputType.emailAddress,
      validator: (v) {
        if (v.isEmpty) {
          return 'Email is required';
        }
        // Simple regex for email validation
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(v)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}

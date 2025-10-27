import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadPasswordField extends StatelessWidget {
  const ShadPasswordField({
    super.key,
    required this.controller,
    required this.isPasswordVisible,
    this.onToggleVisibility,
  });

  final TextEditingController controller;
  final bool isPasswordVisible;
  final void Function()? onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      id: 'password',
      controller: controller,
      label: Text('Password'),
      obscureText: !isPasswordVisible,
      placeholder: const Text("••••••", style: TextStyle(fontSize: 16)),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 18,
        icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: onToggleVisibility,
      ),
      validator: (v) {
        if (v.isEmpty) {
          return 'Password is required';
        }
        if (v.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}

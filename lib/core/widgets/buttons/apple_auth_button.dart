import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppleAuthButton extends StatelessWidget {
  const AppleAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      width: double.infinity,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // FaIcon(Icons.apple_rounded, size: 22),
          FaIcon(FontAwesomeIcons.apple, size: 18),

          SizedBox(width: 8),
          Text("Continue with Apple"),
        ],
      ),
    );
  }
}

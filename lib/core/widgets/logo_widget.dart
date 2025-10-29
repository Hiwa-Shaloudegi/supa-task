import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.scale = 4});

  final double? scale;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png', scale: 4);
  }
}

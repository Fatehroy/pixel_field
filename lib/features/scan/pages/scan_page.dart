import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

class ScanPage extends StatelessWidget {
  static const String path = "/scan";
  static const String name = "Scan";
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Scan Page",
        style: context.textStyle.titleLarge!
            .copyWith(color: context.colorScheme.onSecondary, fontSize: 32),
      )),
    );
  }
}

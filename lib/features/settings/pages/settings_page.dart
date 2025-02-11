import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

class SettingsPage extends StatelessWidget {
  static const String path = "/settings";
  static const String name = "Settings";
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Settings Page",
        style: context.textStyle.titleLarge!
            .copyWith(color: context.colorScheme.onSecondary, fontSize: 32),
      )),
    );
  }
}

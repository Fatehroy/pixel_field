import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

class ShopPage extends StatelessWidget {
  static const String path = "/shop";
  static const String name = "Shop";
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Shop Page",
        style: context.textStyle.titleLarge!
            .copyWith(color: context.colorScheme.onSecondary, fontSize: 32),
      )),
    );
  }
}

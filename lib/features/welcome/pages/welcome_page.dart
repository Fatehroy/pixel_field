import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static const String path = "/welcome";
  static const String name = "Welcome";
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome Page")),
    );
  }
}

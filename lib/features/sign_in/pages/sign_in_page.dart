import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const String path = "/sign-in";
  static const String name = "SignIn";
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Sign In Page")),
    );
  }
}

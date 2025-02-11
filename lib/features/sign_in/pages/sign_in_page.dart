import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/core/router/main_navigation.dart';

class SignInPage extends StatefulWidget {
  static const String path = "/sign-in";
  static const String name = "SignIn";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.paddingOf(context).top + 44.0),
            GestureDetector(
              onTap: () => context.pop(),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Sign in",
              style: context.textStyle.titleLarge!
                  .copyWith(color: context.colorScheme.onSecondary, fontSize: 32),
            ),
            SizedBox(height: 40),
            Text(
              "Email",
              style: TextStyle(color: Colors.amber),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "email@email.com",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Password",
              style: TextStyle(color: Colors.amber),
            ),
            TextField(
              obscureText: _obscurePassword,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.push(MainNavigationPage.path),
                    child: Text(
                      'Continue',
                      style: context.textStyle.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Can't sign in? ",
                  style: context.textStyle.labelLarge!
                      .copyWith(color: context.colorScheme.onSecondary),
                ),
                SizedBox(width: 12),
                TextButton(
                  onPressed: () {
                    context.push(SignInPage.path);
                  },
                  child: const Text(
                    "Recover password",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

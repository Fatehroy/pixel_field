import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field/core/constants/app_assets.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/core/router/main_navigation.dart';
import 'package:pixel_field/features/sign_in/pages/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  static const String path = "/welcome";
  static const String name = "Welcome";
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppAssets.background,
            ),
          ),
        ),
        child: Container(
          color: context.colorScheme.onSurface,
          padding: const EdgeInsets.all(24.0),
          margin:
              EdgeInsets.fromLTRB(24.0, 24.0, 24.0, MediaQuery.paddingOf(context).bottom + 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome!',
                style: context.textStyle.titleLarge!
                    .copyWith(color: context.colorScheme.onSecondary, fontSize: 32),
              ),
              const SizedBox(height: 20),
              Text(
                'Text text text',
                style:
                    context.textStyle.bodyLarge!.copyWith(color: context.colorScheme.onSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle scan bottle action
                      },
                      child: Text(
                        'Scan bottle',
                        style: context.textStyle.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account?',
                    style: context.textStyle.labelLarge!
                        .copyWith(color: context.colorScheme.onSecondary),
                  ),
                  SizedBox(width: 12),
                  TextButton(
                    onPressed: () {
                      context.push(SignInPage.path);
                    },
                    child: const Text(
                      'Sign in first',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

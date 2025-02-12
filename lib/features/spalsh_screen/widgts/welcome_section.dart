import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

import '../../sign_in/pages/sign_in_page.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.onSurface,
      padding: const EdgeInsets.all(24.0),
      margin: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, MediaQuery.paddingOf(context).bottom + 16.0),
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
            style: context.textStyle.bodyLarge!.copyWith(color: context.colorScheme.onSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.push(SignInPage.path),
                  child: Text(
                    'Scan bottle',
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
                'Have an account?',
                style:
                    context.textStyle.labelLarge!.copyWith(color: context.colorScheme.onSecondary),
              ),
              SizedBox(width: 12),
              TextButton(
                onPressed: () => context.push(SignInPage.path),
                child: const Text(
                  'Sign in first',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

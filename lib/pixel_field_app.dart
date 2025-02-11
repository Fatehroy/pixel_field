import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/di/di.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';

class PixelFieldApp extends StatelessWidget {
  const PixelFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = sl<AppRouter>().router;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: GlobalThemData.darkThemeData,
      darkTheme: GlobalThemData.darkThemeData,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field/features/collection_details/cubit/collection_details_cubit.dart';

import 'core/di/di.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'features/collection/cubit/collection_cubit.dart';

class PixelFieldApp extends StatelessWidget {
  const PixelFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = sl<AppRouter>().router;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<CollectionDetailsCubit>()),
        BlocProvider(create: (context) => sl<CollectionCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: GlobalThemData.darkThemeData,
        darkTheme: GlobalThemData.darkThemeData,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_field/core/constants/app_assets.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/features/collection/cubit/collection_cubit.dart';
import 'package:pixel_field/features/collection/cubit/collection_state.dart';

import '../../../core/di/di.dart';
import '../../../core/widgets/svg_icon.dart';
import '../widgets/car_card.dart';

class CollectionPage extends StatefulWidget {
  static const String path = "/collection";
  static const String name = "Collection";
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  void initState() {
    sl<CollectionCubit>().fetchCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: context.colorScheme.onSecondary,
        automaticallyImplyLeading: false,
        title: const Text('My collection'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Badge(
                alignment: Alignment.centerRight,
                backgroundColor: context.colorScheme.error,
                child: SvgIcon(assetName: AppAssets.bell, color: context.colorScheme.onSecondary)),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => sl<CollectionCubit>().fetchCars(),
        child: BlocBuilder<CollectionCubit, CollectionState>(builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (cars) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 0.9,
                ),
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: cars[index]);
                },
              ),
            ),
            error: (message) => Center(
              child: Text('Error: $message',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: context.colorScheme.onSecondary)),
            ),
          );
        }),
      ),
    );
  }
}

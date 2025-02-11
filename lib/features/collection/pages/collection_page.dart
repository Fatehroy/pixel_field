import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field/core/constants/app_assets.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/features/collection_details/pages/collection_details_page.dart';

import '../../../core/widgets/svg_icon.dart';
import '../model/car_model.dart';

final List<CarProduct> cars = [
  CarProduct(
    id: '2',
    make: 'BMW',
    model: 'M2',
    year: 2017,
    price: 147500,
    imageUrl: AppAssets.bmw,
    description: '(1/5)',
  ),
];

class CollectionPage extends StatelessWidget {
  static const String path = "/collection";
  static const String name = "Collection";
  const CollectionPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 0.9,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return CarProductCard(car: cars[0]);
          },
        ),
      ),
    );
  }
}

class CarProductCard extends StatelessWidget {
  final CarProduct car;

  const CarProductCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(CollectionDetailsPage.path, extra: {'carProduct': car}),
      child: Card(
        elevation: 0,
        color: context.colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Image
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(car.imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // Car Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${car.make} ${car.model}',
                      style: context.textStyle.titleLarge!
                          .copyWith(color: context.colorScheme.onSecondary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      car.year.toString(),
                      style: context.textStyle.labelMedium!
                          .copyWith(color: context.colorScheme.onSecondary),
                    ),
                    if (car.description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        car.description!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

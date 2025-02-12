import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/features/collection_details/models/car_details_model.dart';
import 'package:pixel_field/features/collection_details/widgets/car_details_tabs.dart';

import 'header_section.dart';

class CarDetailsSection extends StatelessWidget {
  const CarDetailsSection({super.key, required this.carProduct});
  final CarDetailsModel carProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.onSurface,
      padding: const EdgeInsets.all(_padding),
      margin: const EdgeInsets.all(_margin),
      child: Column(
        children: [
          HeaderSection(carProduct: carProduct),
          CarDetailsSectionTabs(carProduct: carProduct),
        ],
      ),
    );
  }

  static const double _padding = 16.0;
  static const double _margin = 16.0;
}

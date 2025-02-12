import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

import '../../collection/model/car_model.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.carProduct});
  final CarProduct carProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'In Stock: ${carProduct.stockCount}',
          style: context.textStyle.labelMedium?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: _spacing),
        Row(
          children: [
            Text(
              '${carProduct.make} ${carProduct.model}',
              style: context.textStyle.titleLarge?.copyWith(color: context.colorScheme.onSecondary),
            ),
            const SizedBox(width: _spacing),
            Text(
              '${carProduct.year}',
              style: context.textStyle.titleLarge?.copyWith(color: context.colorScheme.primary),
            ),
          ],
        ),
        const SizedBox(height: _spacing),
      ],
    );
  }

  static const double _spacing = 8.0;
}

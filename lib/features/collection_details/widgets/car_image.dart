import 'package:flutter/material.dart';

class CarImage extends StatelessWidget {
  final String imageUrl;
  const CarImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).width,
        // height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

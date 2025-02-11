import 'package:flutter/material.dart';

class CollectionDetailsPage extends StatelessWidget {
  static const String path = "/collection-details";
  static const String name = "CollectionDetails";
  const CollectionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Collection Details Page")),
    );
  }
}

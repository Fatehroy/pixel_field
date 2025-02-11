import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  static const String path = "/collection";
  static const String name = "Collection";
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Collection Page")),
    );
  }
}

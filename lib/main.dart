import 'package:flutter/material.dart';
import 'package:pixel_field/pixel_field_app.dart';

import 'core/di/di.dart';

Future<void> main() async {
  // DI
  await init();

  runApp(const PixelFieldApp());
}

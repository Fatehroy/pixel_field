import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primary => colorScheme.primary;
}

//
extension TextStyleExtension on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;
}

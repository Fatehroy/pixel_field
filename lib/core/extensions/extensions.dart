import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primary => colorScheme.primary;
}

//
extension NavigationExtension on BuildContext {
  Future<T?> showMyDialog<T>({required Widget child, bool isDismissible = true}) {
    return showDialog<T>(
        context: this, builder: (context) => child, barrierDismissible: isDismissible);
  }

  Future<T?> showBottomSheet<T>({required Widget child, bool isDismissible = true}) {
    return showModalBottomSheet<T>(
      context: this,
      builder: (context) => child,
    );
  }

  void showSucessSnackBar(Widget child, {bool? isDismissible, Duration? duration}) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: child,
        backgroundColor: Colors.green,
        dismissDirection: isDismissible ?? true ? DismissDirection.down : DismissDirection.none,
        duration: duration ?? const Duration(seconds: 4),
      ));
  }
}

//
extension TextStyleExtension on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;
}

//
extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

//
bool isValidEmail(String value) {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return regex.hasMatch(value);
}

//
extension SizedBoxExtension on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

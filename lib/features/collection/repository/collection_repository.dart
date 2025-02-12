import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/car_model.dart';

class CollectionRepository {
  static const String _jsonPath = 'assets/data/cars.json';

  Future<List<CarModel>> fetchCars() async {
    try {
      final String jsonString = await rootBundle.loadString(_jsonPath);
      await Future.delayed(Durations.long2);
      final List<CarModel> cars = CarModel.fromJsonList(jsonString);
      return cars;
    } catch (e) {
      throw Exception('Failed to load car data: $e');
    }
  }
}

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/network_checker.dart';
import '../model/car_model.dart';

class CollectionRepository {
  static const String _jsonPath = 'assets/data/cars.json';
  static const String _cacheKey = 'cached_cars';

  Future<List<CarModel>> fetchCars() async {
    final bool isOnline = await hasInternetConnection();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isOnline) {
      try {
        final String jsonString = await rootBundle.loadString(_jsonPath);
        await Future.delayed(Duration(milliseconds: 500));
        final List<CarModel> cars = CarModel.fromJsonList(jsonString);

        prefs.setString(_cacheKey, jsonString);

        return cars;
      } catch (e) {
        throw Exception('Failed to load car data: $e');
      }
    } else {
      final String? cachedData = prefs.getString(_cacheKey);
      if (cachedData != null) {
        return CarModel.fromJsonList(cachedData);
      }

      throw Exception('No internet connection and no cached data available.');
    }
  }
}

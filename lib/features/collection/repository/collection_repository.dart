import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/network_checker.dart';
import '../model/car_model.dart';

class CollectionRepository {
  static const String _jsonPath = 'assets/data/cars.json';
  static const String _cacheKey = 'cached_cars';

  /// Fetches car data from the JSON file if online; otherwise, uses cached data.
  Future<List<CarModel>> fetchCars() async {
    final bool isOnline = await hasInternetConnection();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isOnline) {
      try {
        print("-----> fetched Remotly");
        final String jsonString = await rootBundle.loadString(_jsonPath);
        await Future.delayed(Duration(milliseconds: 500));
        final List<CarModel> cars = CarModel.fromJsonList(jsonString);

        // Cache data for offline usage
        prefs.setString(_cacheKey, jsonString);

        return cars;
      } catch (e) {
        throw Exception('Failed to load car data: $e');
      }
    } else {
      print("-----> fetched from cache");
      // Fetch from cache if available
      final String? cachedData = prefs.getString(_cacheKey);
      if (cachedData != null) {
        return CarModel.fromJsonList(cachedData);
      }

      throw Exception('No internet connection and no cached data available.');
    }
  }
}

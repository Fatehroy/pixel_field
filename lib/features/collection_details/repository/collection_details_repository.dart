import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/network_checker.dart';
import '../models/car_details_model.dart';

class CollectionDetailsRepository {
  static const String _detailsJsonPath = 'assets/data/car_details.json';
  static const String _cacheKey = 'cached_car_details';

  Future<CarDetailsModel> fetchCarDetailsById(String carId) async {
    final bool isOnline = await hasInternetConnection();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isOnline) {
      try {
        final String jsonString = await rootBundle.loadString(_detailsJsonPath);
        await Future.delayed(Duration(milliseconds: 500)); // Simulating API delay

        prefs.setString(_cacheKey, jsonString);

        return _extractCarDetails(jsonString, carId);
      } catch (e) {
        throw Exception('Failed to load car details: $e');
      }
    } else {
      final String? cachedData = prefs.getString(_cacheKey);
      if (cachedData != null) {
        return _extractCarDetails(cachedData, carId);
      }

      throw Exception('No internet connection and no cached data available.');
    }
  }

  CarDetailsModel _extractCarDetails(String jsonString, String carId) {
    final List<dynamic> jsonData = json.decode(jsonString);

    final carData = jsonData.firstWhere(
      (car) => car['id'] == carId,
      orElse: () => null,
    );

    if (carData == null) {
      throw Exception('Car details not found for ID: $carId');
    }

    return CarDetailsModel.fromJson(carData);
  }
}

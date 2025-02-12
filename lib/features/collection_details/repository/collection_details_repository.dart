import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/car_details_model.dart';

class CollectionDetailsRepository {
  static const String _detailsJsonPath = 'assets/data/car_details.json';

  Future<CarDetailsModel> fetchCarDetailsById(String carId) async {
    try {
      // Load the JSON data from the file
      final String jsonString = await rootBundle.loadString(_detailsJsonPath);
      final List<dynamic> jsonData = json.decode(jsonString);

      // Find the car with the matching carId
      final carData = jsonData.firstWhere(
        (car) => car['id'] == carId,
        orElse: () => null,
      );

      if (carData == null) {
        throw Exception('Car details not found for ID: $carId');
      }

      // Return the car details as a CarDetailsModel
      return CarDetailsModel.fromJson(carData);
    } catch (e) {
      throw Exception('Failed to load car details: $e');
    }
  }
}

import 'dart:convert';

class CarModel {
  final String id;
  final String make;
  final String model;
  final int year;
  final String imageUrl;
  final int stockCount;

  CarModel({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.imageUrl,
    required this.stockCount,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      imageUrl: json['imageUrl'],
      stockCount: json['stockCount'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'year': year,
      'imageUrl': imageUrl,
      'stockCount': stockCount,
    };
  }

  // From JSON List
  static List<CarModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((car) => CarModel.fromJson(car)).toList();
  }

  // To JSON List
  static String toJsonList(List<CarModel> cars) {
    final List<Map<String, dynamic>> jsonList = cars.map((car) => car.toJson()).toList();
    return json.encode(jsonList);
  }
}

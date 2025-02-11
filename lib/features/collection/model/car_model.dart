// car_product_model.dart
class CarProduct {
  final String id;
  final String make;
  final String model;
  final int year;
  final double price;
  final String imageUrl;
  final String? description;

  CarProduct({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.price,
    required this.imageUrl,
    this.description,
  });

  factory CarProduct.fromJson(Map<String, dynamic> json) {
    return CarProduct(
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: json['year'] as int,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
    );
  }
}

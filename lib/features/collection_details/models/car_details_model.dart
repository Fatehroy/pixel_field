class CarDetailsModel {
  final String id;
  final String make;
  final String model;
  final int year;
  final String imageUrl;
  final int stockCount;
  final List<Specification> specifications;
  final List<PerformanceFeature> performanceAndFeatures;
  final List<HistoryAndLegacy> historyAndLegacy;

  CarDetailsModel({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.imageUrl,
    required this.stockCount,
    required this.specifications,
    required this.performanceAndFeatures,
    required this.historyAndLegacy,
  });

  factory CarDetailsModel.fromJson(Map<String, dynamic> json) {
    return CarDetailsModel(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      imageUrl: json['imageUrl'],
      stockCount: json['stockCount'],
      specifications: (json['specifications'] as List)
          .map((item) => Specification.fromJson(item))
          .toList(),
      performanceAndFeatures: (json['performanceAndFeatures'] as List)
          .map((item) => PerformanceFeature.fromJson(item))
          .toList(),
      historyAndLegacy: (json['historyAndLegacy'] as List)
          .map((item) => HistoryAndLegacy.fromJson(item))
          .toList(),
    );
  }
}

class Specification {
  final String title;
  final String value;

  Specification({required this.title, required this.value});

  factory Specification.fromJson(Map<String, dynamic> json) {
    return Specification(
      title: json['title'],
      value: json['value'],
    );
  }
}

class PerformanceFeature {
  final String title;
  final String value;

  PerformanceFeature({required this.title, required this.value});

  factory PerformanceFeature.fromJson(Map<String, dynamic> json) {
    return PerformanceFeature(
      title: json['title'],
      value: json['value'],
    );
  }
}

class HistoryAndLegacy {
  final String title;
  final String description;

  HistoryAndLegacy({required this.title, required this.description});

  factory HistoryAndLegacy.fromJson(Map<String, dynamic> json) {
    return HistoryAndLegacy(
      title: json['title'],
      description: json['description'],
    );
  }
}

import '../../../core/constants/app_assets.dart';

class CarProduct {
  final String id;
  final String make;
  final String model;
  final int year;

  final String imageUrl;
  final int stockCount;
  final List<Specification> specifications;
  final List<PerformanceFeature> performanceAndFeatures;
  final List<HistoryAndLegacy> historyAndLegacy;

  CarProduct({
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
}

class Specification {
  final String title;
  final String value;

  Specification({required this.title, required this.value});
}

class PerformanceFeature {
  final String title;
  final String value;

  PerformanceFeature({required this.title, required this.value});
}

class HistoryAndLegacy {
  final String title;
  final String description;

  HistoryAndLegacy({required this.title, required this.description});
}

// Example Usage
CarProduct bmwM2 = CarProduct(
  id: '2',
  make: 'BMW',
  model: 'M2',
  year: 2017,
  imageUrl: AppAssets.bmw,
  stockCount: 1,
  specifications: [
    Specification(title: 'Engine', value: '3.0L Twin-Turbo Inline-6'),
    Specification(title: 'Horsepower', value: '365 HP'),
    Specification(title: 'Torque', value: '343 lb-ft'),
    Specification(title: 'Transmission', value: '6-Speed Manual / 7-Speed DCT'),
    Specification(title: 'Drivetrain', value: 'RWD'),
    Specification(title: 'Fuel Efficiency', value: '18 MPG city / 26 MPG highway'),
  ],
  performanceAndFeatures: [
    PerformanceFeature(title: '0-60 mph', value: '4.2 seconds'),
    PerformanceFeature(title: 'Top Speed', value: '155 mph (electronically limited)'),
    PerformanceFeature(title: 'Braking', value: 'M Sport Brakes'),
    PerformanceFeature(title: 'Interior', value: 'Leather Sport Seats, iDrive Infotainment'),
    PerformanceFeature(title: 'Safety', value: 'Lane Departure Warning, ABS, Airbags'),
  ],
  historyAndLegacy: [
    HistoryAndLegacy(
      title: 'Model Evolution',
      description:
          'The M2 debuted in 2016 as BMW’s compact performance coupe, inspired by the E46 M3.',
    ),
    HistoryAndLegacy(
      title: 'Special Editions',
      description: 'M2 Competition (2018), M2 CS (2020)',
    ),
    HistoryAndLegacy(
      title: 'Racing Heritage',
      description: 'Competes in various touring car championships.',
    ),
    HistoryAndLegacy(
      title: 'Pop Culture',
      description: 'Featured in car magazines, gaming (Forza, Gran Turismo)',
    ),
  ],
);

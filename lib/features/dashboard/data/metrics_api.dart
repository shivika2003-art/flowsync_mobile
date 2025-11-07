import 'dart:math';
import 'metrics_model.dart';

Future<Metrics> fetchMetrics(String range) async {
  final days = (range == '90') ? 90 : (range == '7') ? 7 : 30;
  final rng = Random();

  final dates = List.generate(days, (i) => "Day ${i + 1}");
  final dau = List.generate(days, (i) => 100 + rng.nextInt(200));
  final revenue = List.generate(days, (i) => 200 + rng.nextInt(300) * 1.0);
  final breakdown = [
    {"category": "Search", "value": 40},
    {"category": "Checkout", "value": 35},
    {"category": "Profile", "value": 25},
  ];

  return Metrics(dates: dates, dau: dau, revenue: revenue, breakdown: breakdown);
}

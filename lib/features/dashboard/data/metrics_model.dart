class Metrics {
  final List<String> dates;
  final List<int> dau;
  final List<double> revenue;
  final List<Map<String, dynamic>> breakdown;

  Metrics({
    required this.dates,
    required this.dau,
    required this.revenue,
    required this.breakdown,
  });
}

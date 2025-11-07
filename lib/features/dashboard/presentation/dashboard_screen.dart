import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/metrics_api.dart';
import '../data/metrics_model.dart';

final rangeProvider = StateProvider<String>((ref) => '30');

final metricsProvider = FutureProvider<Metrics>((ref) async {
  final range = ref.watch(rangeProvider);
  return fetchMetrics(range);
});

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final range = ref.watch(rangeProvider);
    final asyncData = ref.watch(metricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlowSync Analytics'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: '7', label: Text('7d')),
                ButtonSegment(value: '30', label: Text('30d')),
                ButtonSegment(value: '90', label: Text('90d')),
              ],
              selected: {range},
              onSelectionChanged: (s) =>
                  ref.read(rangeProvider.notifier).state = s.first,
            ),
          ),
        ],
      ),
      body: asyncData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (m) => _DashboardCharts(m),
      ),
    );
  }
}

class _DashboardCharts extends StatelessWidget {
  final Metrics m;
  const _DashboardCharts(this.m);

  @override
  Widget build(BuildContext context) {
    final rows = List.generate(
      m.dates.length,
      (i) => _Row(date: m.dates[i], dau: m.dau[i], revenue: m.revenue[i]),
    );

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: const ChartTitle(text: 'Daily Active Users'),
                  series: <LineSeries<_Row, String>>[
                    LineSeries<_Row, String>(
                      dataSource: rows,
                      xValueMapper: (r, _) => r.date,
                      yValueMapper: (r, _) => r.dau,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SfCircularChart(
                  title: const ChartTitle(text: 'Feature Breakdown'),
                  series: <PieSeries<Map<String, dynamic>, String>>[
                    PieSeries<Map<String, dynamic>, String>(
                      dataSource: m.breakdown,
                      xValueMapper: (d, _) => d['category'] as String,
                      yValueMapper: (d, _) => d['value'] as num,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Row {
  final String date;
  final int dau;
  final double revenue;
  _Row({required this.date, required this.dau, required this.revenue});
}

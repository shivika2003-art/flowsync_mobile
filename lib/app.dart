import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';

class FlowSyncApp extends StatelessWidget {
  const FlowSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, __) => const DashboardScreen()),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6750A4),
      ),
    );
  }
}

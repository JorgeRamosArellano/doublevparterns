import 'package:double_v_partners_jorge_test/routes/routes_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Jorge Ramos Test - DVP',
      routerConfig: routerTree,
      debugShowCheckedModeBanner: false,
    );
  }
}
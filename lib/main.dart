import 'package:flutter/material.dart';
import 'package:retail_intel_v2/ui/dashboard.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retail Intelligence',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.primaryBg
      ),
      home: const Dashboard(),
    );
  }
}

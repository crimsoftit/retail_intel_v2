import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:retail_intel_v2/app.dart';
import 'package:retail_intel_v2/firebase_options.dart';
import 'package:retail_intel_v2/ui/dashboard.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';

Future<void> main() async {
  // add widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // GetX (initialize) local storage
  await GetStorage.init();

  // await native splash

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //runApp(const MyApp());

  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retail Intelligence',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.primaryBg),
      home: const Dashboard(),
    );
  }
}

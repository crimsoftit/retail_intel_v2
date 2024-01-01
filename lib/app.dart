import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_intel_v2/ui/dashboard.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/utils/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,

      // show circular progress indicator while authentication repository is decides on the relevant screen to display
      // home: const Scaffold(
      //   backgroundColor: AppColors.primaryBlue,
      //   body: Center(
      //     child: CircularProgressIndicator(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      home: const Dashboard(),
    );
  }
}

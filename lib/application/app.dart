import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utils/app_colors.dart';

class DeltaLPGSalesApp extends StatelessWidget {
  const DeltaLPGSalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Delta LPG Sales App",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryButtonColor,
            statusBarIconBrightness: Brightness.light, // white icons on green bg
            statusBarBrightness: Brightness.dark,      // iOS equivalent
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

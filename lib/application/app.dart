import 'package:flutter/material.dart';
import '../presentation/ui/screens/splash_screen.dart';

class DeltaLPGSalesApp extends StatelessWidget {
  const DeltaLPGSalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Delta LPG Sales App",
      // theme: ThemeData(
      //   primaryColor: Colors.red, // 🔴 Change this to any color you want
      //   colorScheme: ColorScheme.fromSwatch().copyWith(
      //     primary: Colors.red, // Make sure primary color is applied consistently
      //   ),
      //   // Optional: You can also customize other colors like accent, background, etc.
      //   scaffoldBackgroundColor: Colors.white,
      // ),
      home: const SplashScreen(),
    );
  }
}

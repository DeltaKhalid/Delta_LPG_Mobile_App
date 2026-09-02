import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utils/app_colors.dart';

class DeltaLPGSalesApp extends StatelessWidget {
  /// Global key for handling navigation without context (e.g. 401 errors in network_caller.dart)
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const DeltaLPGSalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: DeltaLPGSalesApp.globalKey, // for using global key, for 401 error
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





























// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../presentation/ui/screens/splash_screen.dart';
// import '../presentation/ui/utils/app_colors.dart';
//
// class DeltaLPGSalesApp extends StatelessWidget {
//   const DeltaLPGSalesApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Delta LPG Sales App",
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor: AppColors.primaryButtonColor,
//             statusBarIconBrightness: Brightness.light, // white icons on green bg
//             statusBarBrightness: Brightness.dark,      // iOS equivalent
//           ),
//         ),
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

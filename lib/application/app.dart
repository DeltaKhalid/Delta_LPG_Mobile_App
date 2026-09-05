
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../presentation/state_holders/login_controller.dart';
import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utils/app_colors.dart';

class DeltaLPGSalesApp extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey =
  GlobalKey<NavigatorState>();

  const DeltaLPGSalesApp({super.key});

  @override
  State<DeltaLPGSalesApp> createState() => _DeltaLPGSalesAppState();
}

/// =================================================== Start State ============================================== ///
class _DeltaLPGSalesAppState extends State<DeltaLPGSalesApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: DeltaLPGSalesApp.globalKey,
      debugShowCheckedModeBanner: false,
      title: "Delta LPG Sales App V 1.0.0",
      ///======================================== ThemeData design for Full app ========================================///
      theme: ThemeData(

        ///--- Primary Color of All App ---///
        //primarySwatch: MaterialColor(AppColors.primaryColorShadRedAccent.value, AppColors().color),
        // primarySwatch: MaterialColor(AppColors.primaryColorRead.value, AppColors().color),



        /// --- AppBar design --- ///
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryButtonColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),

      ),




      // home: const SplashScreen(),

      ///--- *** for Bind with GetX controller ---///
      initialBinding:  ControllerBinding(),
      ///--- Splash Screen Call ---///
      home: const SplashScreen(),




    );
  }
}


//*** for Bind with GetX controller
class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<LoginController>(LoginController());
    // Get.put<StateListController>(StateListController());
    // Get.put<ZoneListController>(ZoneListController());
    // Get.put<AreaListController>(AreaListController());
    //Get.put<PaymentListController>(PaymentListController());
    // Get.put<AttendanceInfoGetController>(AttendanceInfoGetController());
    // Get.put<AttendanceReportController>(AttendanceReportController());
  }
}






















// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../presentation/ui/screens/splash_screen.dart';
// import '../presentation/ui/utils/app_colors.dart';
//
// class DeltaLPGSalesApp extends StatelessWidget {
//   /// Global key for handling navigation without context (e.g. 401 errors in network_caller.dart)
//   static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
//   const DeltaLPGSalesApp({super.key});
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: DeltaLPGSalesApp.globalKey, // for using global key, for 401 error
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

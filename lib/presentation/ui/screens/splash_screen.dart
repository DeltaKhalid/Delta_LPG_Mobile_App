import 'package:avatar_glow/avatar_glow.dart';
import 'package:delta_lpg_product_sale/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';
import '../utils/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  ///======================================== Function write area ==========================================================================///
  Future<void> navigateToLogin() async {
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      // final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  HomeScreen()),
                (route) => false);
      }
    });

  }

  ///======================================== "init" State Call Area =======================================================================///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLogin();   /// Function Call "Start" Splash Screen 5 Second delay code
  }

  ///======================================== Scaffold Part =================================================================================///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //color: appColors.color[50],
          //color: AppColors.primaryColor,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ///---------- Logo Animation ----------///
                AvatarGlow(
                  // glowColor: Colors.orange,  // Use a visible color first for testing
                  // endRadius: 120.0,          // Bigger glow radius
                  // duration: const Duration(milliseconds: 2000),
                  // repeat: true,
                  // showTwoGlows: true,
                  // repeatPauseDuration: const Duration(milliseconds: 100),
                  child: Material(
                    elevation: 8.0,
                    shape: const CircleBorder(),

                    child: CircleAvatar(
                      // backgroundColor: Colors.grey[100],
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Image.asset(
                        ImageAssets.logoSplashScreenLogoPNG,
                        height: 80,
                      ),
                    ),

                  ),
                ),

                const Spacer(),

                /// ---------- Loader Animation ----------///
                SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                ),


                /// ---------- Version Text ----------///
                SizedBox(
                  height: 40,
                  //color: Colors.greenAccent,
                  child: const Center(
                    child: Text(
                      '1.0.0',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColorSecondShad02
                      ),
                    ),
                  ),
                )

                // SizedBox(height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


































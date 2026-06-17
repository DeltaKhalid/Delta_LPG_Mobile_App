
import 'package:delta_lpg_product_sale/presentation/ui/screens/registration_screen.dart';
import 'package:delta_lpg_product_sale/presentation/ui/widgets/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../screens/drawer/about_us_screen.dart';
import '../../screens/drawer/contact_us_screen.dart';
import '../../screens/drawer/delivery_charge_screen.dart';
import '../../screens/drawer/faq_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/drawer/return_refund_screen.dart';
import '../../screens/drawer/safety_guide_screen.dart';
import '../../screens/drawer/tutorial_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_assets.dart';
import 'package:avatar_glow/avatar_glow.dart';


class CustomDrawerSecond extends StatefulWidget {
  const CustomDrawerSecond({super.key});

  @override
  State<CustomDrawerSecond> createState() => _CustomDrawerSecondState();
}

/// *** "Main Drawer" Widget for the app, which provides navigation to different screens and a logout option.




///================================================================== Custom Drawer Widget ==========================================================///
class _CustomDrawerSecondState extends State<CustomDrawerSecond> {
  void _navigateTo(Widget page, {bool clearStack = false}) {
    Navigator.of(context).pop();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final route = PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 280),
        reverseTransitionDuration: const Duration(milliseconds: 280),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          final tween = Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
      if (clearStack) {
        Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
      } else {
        Navigator.of(context).push(route);
      }
    });
  }


  ///======================================== LogOut Function ==========================================================///
  Future<bool> _logOutFunctionCall() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Set your desired corner radius here
        ),
        titlePadding: const EdgeInsets.only(left: 16, top: 20),
        contentPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 0),
        title: const Center(child: Text('Are you sure?'),),
        //content: const Text('Do you want to exit'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.redAccent, // Set your desired color for the divider
                thickness: 0.5, // Set the thickness of the divider
              ),
            ),
            const SizedBox(height: 20),
            Container(
              //padding: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///--- No press Event Work ---///
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.grey, // Set your desired color for "No" button
                    ),
                    child: const Text('No'),
                  ),
                  ///--- Yes Press Event Work ---///
                  ElevatedButton(
                    onPressed: () {




                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.red, // Set your desired color for "Yes" button
                      //backgroundColor: Colors.greenAccent,
                    ),
                    child: const Text('Yes'),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    )) ?? false;
  }


  ///======================================== Drawer part =================================================================///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 220,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [

                DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Material(
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70.0,
                              child: ClipOval(
                                child: Image.asset(
                                  ImageAssets.deltaLPGLogoPNG,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),




             ///------------------ old code 03 -----------------------------///
            // DrawerHeader(
            //   padding: const EdgeInsets.all(0),
            //   child: Container(
            //     child: Row(
            //       children: [
            //         Expanded(
            //           flex: 8,
            //           child: AvatarGlow(
            //             child: Material(
            //               elevation: 8.0,
            //               shape: const CircleBorder(),
            //               child: CircleAvatar(
            //                 backgroundColor: Colors.white,
            //                 radius: 70.0,
            //                 child: ClipOval(
            //                   child: Image.asset(
            //                     ImageAssets.deltaLPGLogoPNG,
            //                     height: 90,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),




            ///------------ Old code 02 -------------------------------///
            // DrawerHeader(
            //   padding: const EdgeInsets.all(0),
            //
            //   child: Container(
            //     //height: 50,
            //     //color: Colors.cyanAccent,
            //     child: Row(
            //       children: [
            //
            //
            //         Expanded(
            //           flex: 8,
            //           child: Container(
            //               padding: const EdgeInsets.all(5),
            //               margin: EdgeInsets.only(left: 10),
            //               height: 100,
            //               //color: Colors.green,
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 border: Border.all(
            //                   //color: Colors.green, // Border color
            //                   color: AppColors.primaryColorSecond, // Border color
            //                   width: 1.0, // Border width
            //                 ),
            //               ),
            //
            //
            //
            //               child: CircleAvatar(
            //                 radius: 40.0,
            //                 backgroundColor: Colors.transparent, // optional
            //                 child: ClipOval(
            //                   child: Image.asset(
            //                     ImageAssets.deltaLPGLogoPNG,
            //                     height: 60,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               )
            //
            //
            //
            //
            //
            //             // child: const CircleAvatar(
            //             //   //backgroundColor: Colors.redAccent[100],
            //             //
            //             //   radius: 40.0,
            //             //   // child: Image.asset(
            //             //   //   ImageAssets.imageDemoProfilePNG,
            //             //   //   height: 60,
            //             //   // ),
            //             //
            //             //   backgroundImage: AssetImage(
            //             //     //ImageAssets.imageDemoProfilePNG,
            //             //     ImageAssets.deltaLPGLogoPNG,
            //             //     //height: 60,
            //             //   ),
            //             // ),
            //
            //
            //
            //
            //           ),
            //         ),
            //
            //         /// --- Name and Designation --- ///
            //         // Expanded(
            //         //   flex: 15,
            //         //   child: Container(
            //         //     padding: const EdgeInsets.only(left: 10),
            //         //     height: 70,
            //         //     //color: Colors.redAccent,
            //         //     child: Column(
            //         //       mainAxisAlignment: MainAxisAlignment.center,
            //         //       crossAxisAlignment: CrossAxisAlignment.start,
            //         //       children: [
            //         //         Text(
            //         //           'Khalid Ahmad',
            //         //           // '${AuthUtility.userInfo.data?.firstName}',
            //         //           style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            //         //         ),
            //         //         const Text(
            //         //           //'Executive',
            //         //           'Designation',
            //         //           style: TextStyle(fontSize: 13),
            //         //         ),
            //         //       ],
            //         //     ),
            //         //   ),
            //         // ),
            //
            //
            //
            //
            //       ],
            //     ),
            //   ),
            //
            //   // child: Material(
            //   //   elevation: 8.0,
            //   //   shape: const CircleBorder(),
            //   //   child: CircleAvatar(
            //   //     backgroundColor: Colors.red[100],
            //   //     radius: 40.0,
            //   //     child: Image.asset(
            //   //       ImageAssets.deltaLogoPNG,
            //   //       height: 60,
            //   //     ),
            //   //   ),
            //   // ),
            //
            //
            //
            // ),



            ///---------- Old Code ----------///
            // DrawerHeader(
            //   padding: EdgeInsets.all(30),
            //   child: Material(
            //     elevation: 8.0,
            //     shape: const CircleBorder(),
            //     child: CircleAvatar(
            //       backgroundColor: Colors.grey[100],
            //       radius: 40.0,
            //       child: Image.asset(
            //         ImageAssets.deltaLogoPNG,
            //         height: 60,
            //       ),
            //     ),
            //   ),
            // ),




            ///---------------------------------------- Home -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconDashboardSVG,
                width: 18,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const HomeScreen(), clearStack: true);
              },
            ),
            ///---------------------------------------- Reports -----------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconReportsSVG,
                width: 20,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Reports',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),

              onTap: () {
                _navigateTo(const HomeScreen(initialIndex: 2), clearStack: true);
              },
            ),
            ///---------------------------------------- Order Placement -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconOrderPlacementSVG,
                width: 23,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Order Placement',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const FaqScreen());
              },
            ),
            ///---------------------------------------- Payment Collections -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconPaymentCollectionSVG,
                width: 20,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Payment Collections',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const AboutUsScreen());
              },
            ),
            ///---------------------------------------- Sales Return -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconSalesReturn02SVG,
                width: 22,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Sales Return',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const SafetyGuideScreen());
              },
            ),
            ///---------------------------------------- Achievement -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconAchievementSVG,
                width: 18,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Achievement',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const ReturnRefundScreen());
              },
            ),
            ///---------------------------------------- Reports -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconReportsSVG,
                width: 20,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Reports',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const DeliveryChargeScreen());
              },
            ),
            ///---------------------------------------- Knowledge -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconKnowledge02SVG,
                width: 20,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Knowledge',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const ContactUsScreen());
              },
            ),
            ///---------------------------------------- Settings -------------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconSettingsSVG,
                width: 20,
                colorFilter: const ColorFilter.mode(AppColors.drawerIconTextColor, BlendMode.srcIn),
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                _navigateTo(const RegistrationScreen());
              },
            ),

            ///---------------------------------------- Logout -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(
                ImageAssets.iconLogOut03SVG,
                width: 20,
                colorFilter: const ColorFilter.mode(Color(0xFF62748E), BlendMode.srcIn),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.drawerIconTextColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  LogoutDialog.show(context);
                });
              },
            ),


          ],
        ),
      ),

          ///---------------------------------------- Footer -------------------------------------------------------------///
          const SizedBox(height: 50),
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          //Divider(height: 1, thickness: 1, color: Colors.red[300]),
          SizedBox(height: 10,),

          Container(
            height: 70,
            width: 185,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delta LPG',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.drawerIconTextColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}




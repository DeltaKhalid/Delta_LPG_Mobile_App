
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';




import '../../screens/login_screen.dart';
import '../../utils/app_colors.dart';

import 'package:flutter/material.dart';

import '../../utils/image_assets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}


/// *** this is the custom appbar for "Home Dashboard Screen" and "Knowledge Screen" and "Report Screen" and "Achievement Screen".


class _CustomAppBarState extends State<CustomAppBar> {

  ///========================================= Logout Dialog ===================================///
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titlePadding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        title: const Text(
          'Logout',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.green, thickness: 0.5),
            const SizedBox(height: 12),
            const Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    //await AuthUtility.clearUserInfo();
                    Navigator.of(ctx).pop();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Logout', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ======================================== BackButton Function of ============================= ///
  Future<bool> _onBackButtonPress() async {
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
                      // 'Function' call for all login info Remove
                      // AuthUtility.clearUserInfo();
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      //       (route) => false,
                      // );


                      // //SystemNavigator.pop(); // Exit the app
                      // // after check the end time will be taken
                      // if (_attendanceInfoGetController.userAttendanceStartTime == '00:00') {
                      //   //isOfficeTimeLocationCheckStart = true;
                      //   //attendanceCreateDataTakeInProgress = true;
                      //   //getAttendanceStartTime(true); // Start counting the "Employer's Attendance In time for count"
                      //   _getUserLocationForStartTime();  // Flow : get user location -> Attendance Create API call
                      //   //getAddressFromCoordinates(latitudeOfUser, longitudeOfUser);
                      //   // attendanceCreateApiCall();
                      // } else {
                      //   Get.snackbar(
                      //     'Error!',
                      //     'Your work Start Time has been taken.',
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     duration: const Duration(seconds: 5),
                      //     backgroundColor: Colors.redAccent[200],
                      //     colorText: Colors.white,
                      //     borderRadius: 10,
                      //   );
                      // }



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

  ///========================================= AppBar Design ===================================///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //margin: const EdgeInsets.only(top: 5, bottom: 1, left: 5, right: 5),
        margin: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        height: 40,
        color: Colors.white,
        child: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              )
          ),
          elevation: 0,
          //backgroundColor: AppColors.primaryColorShadRedAccent,
          //backgroundColor: AppColors.primaryColorShadRedAccent,
          //backgroundColor: Colors.greenAccent,
          // backgroundColor: AppColors.primaryColorRead,
          backgroundColor: AppColors.primaryColorSecondShad02,


          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: SvgPicture.asset(
                  //ImageAssets.logoutIcon2SVG,
                  ImageAssets.iconMenu3SVG,
                  width: 23,  // Adjust the width as needed
                  height: 23, // Adjust the height as needed
                ),
                //iconSize: 20,
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColorSecondShad02,
            statusBarIconBrightness: Brightness.light,
          ),
          actions: [
            ///---------- Notification Icon --------------///
            // IconButton(
            //   onPressed: () async {
            //     //await AuthUtility.clearUserInfo();
            //     // if (mounted) {
            //     //   _onBackButtonPress();
            //     // }
            //
            //     Get.to(
            //           () => const NotificationScreen(),
            //       transition: Transition.fadeIn,
            //       //// FaceIn Animation normal Activity change
            //       duration: const Duration(seconds: 1),
            //     );
            //
            //   },
            //   //icon: Icon(SvgPicture.asset(ImageAssets.homeIconSVG)),
            //   icon: SvgPicture.asset(
            //     //ImageAssets.logoutIcon2SVG,
            //     //ImageAssets.iconAttendance6SVG,
            //     ImageAssets.iconNotification04SVG,
            //     width: 24,  // Adjust the width as needed
            //     height: 24, // Adjust the height as needed
            //   ),
            // ),

            ///---------- Search Icon --------------------///
            // IconButton(
            //   onPressed: () async {
            //     //await AuthUtility.clearUserInfo();
            //     if (mounted) {
            //       //_onBackButtonPress();
            //       _showLogoutDialog(context);
            //     }
            //
            //   },
            //   //icon: Icon(SvgPicture.asset(ImageAssets.homeIconSVG)),
            //   icon: SvgPicture.asset(
            //     //ImageAssets.logoutIcon2SVG,
            //     ImageAssets.iconSearchSVG,
            //     width: 24,  // Adjust the width as needed
            //     height: 24, // Adjust the height as needed
            //   ),
            // ),




            ///---------- Logout Icon --------------------///
            IconButton(
              onPressed: () async {
                //await AuthUtility.clearUserInfo();
                if (mounted) {
                  //_onBackButtonPress();
                  _showLogoutDialog(context);
                }

              },
              //icon: Icon(SvgPicture.asset(ImageAssets.homeIconSVG)),
              icon: SvgPicture.asset(
                //ImageAssets.logoutIcon2SVG,
                ImageAssets.iconLogOut2SVG,
                width: 24,  // Adjust the width as needed
                height: 24, // Adjust the height as needed
              ),
            ),


          ],
        ),
      ),
    );
  }



}


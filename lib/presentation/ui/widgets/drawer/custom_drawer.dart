
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../screens/home/home_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_assets.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

/// *** This is not use for now, this is for future use. *** ///

class _CustomDrawerState extends State<CustomDrawer> {

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


  // Future<bool> _logOutFunctionCall() async {
  //   return (await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Center(child: Text('Are you sure?'),),
  //       //content: const Text('Do you want to exit'),
  //       actions: [
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextButton(
  //                 onPressed: () => Navigator.of(context).pop(false),
  //                 child: const Text('No'),
  //               ),
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pushAndRemoveUntil(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => const LoginScreen(),
  //                     ),
  //                         (route) => false,
  //                   );
  //                 },
  //                 child: const Text('Yes'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   )) ?? false;
  // }


  ///======================================== Drawer part =================================================================///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 220,
      child: Container(
        child: ListView(
          children: [

            DrawerHeader(
              padding: const EdgeInsets.all(0),

              child: Container(
                //height: 50,
                //color: Colors.cyanAccent,
                child: Row(
                  children: [

                    // Expanded(
                    //   flex: 7,
                    //   child: Container(
                    //     padding: const EdgeInsets.all(5),
                    //     height: 70,
                    //     child: Container(
                    //       width: 70, // Matching the width with height
                    //       height: 70, // Matching the height with CircleAvatar
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           color: Colors.red, // Border color
                    //           width: 1.0, // Border width
                    //         ),
                    //       ),
                    //       child: CircleAvatar(
                    //         //backgroundColor: Colors.redAccent[100],
                    //         radius: 34.0, // Reduced radius to make space for the border
                    //         child: Image.asset(
                    //           ImageAssets.deltaLogoPNG,
                    //           height: 60,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),



                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: EdgeInsets.only(left: 10),
                        height: 100,
                        //color: Colors.green,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            //color: Colors.green, // Border color
                            color: AppColors.primaryColorSecond, // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: const CircleAvatar(
                          //backgroundColor: Colors.redAccent[100],

                          radius: 40.0,
                          // child: Image.asset(
                          //   ImageAssets.imageDemoProfilePNG,
                          //   height: 60,
                          // ),

                          backgroundImage: AssetImage(
                            //ImageAssets.imageDemoProfilePNG,
                            ImageAssets.deltaLPGLogoPNG,
                            //height: 60,
                          ),
                        ),
                      ),
                    ),

                    /// --- Name and Designation --- ///
                    // Expanded(
                    //   flex: 15,
                    //   child: Container(
                    //     padding: const EdgeInsets.only(left: 10),
                    //     height: 70,
                    //     //color: Colors.redAccent,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Khalid Ahmad',
                    //           // '${AuthUtility.userInfo.data?.firstName}',
                    //           style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    //         ),
                    //         const Text(
                    //           //'Executive',
                    //           'Designation',
                    //           style: TextStyle(fontSize: 13),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),




                  ],
                ),
              ),

              // child: Material(
              //   elevation: 8.0,
              //   shape: const CircleBorder(),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.red[100],
              //     radius: 40.0,
              //     child: Image.asset(
              //       ImageAssets.deltaLogoPNG,
              //       height: 60,
              //     ),
              //   ),
              // ),



            ),



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
              leading: SvgPicture.asset(ImageAssets.iconHomeSVG, width: 23,),
              title: const Text('Home'),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),),);
                // Get.to(
                //       () => const HomeScreen(),
                //   transition: Transition.fadeIn,
                //   //// FaceIn Animation normal Activity change
                //   duration: const Duration(seconds: 1),
                // );
              },
            ),






            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- Payment ---------------------------------------------------------------///
            ListTile(
              leading: SvgPicture.asset(ImageAssets.iconHomeSVG, width: 23,),
              // leading: Image.asset(ImageAssets.iconHomeSVG, width: 24, height: 24), // Use Image.asset()
              title: const Text('Payment'),
              onTap: () {
                print("Payment Menu is Clicked");
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPaymentScreen(),),);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),),);
                //Navigator.of(context).push(CustomRouteBuilder(MaterialPageRoute(builder: (context) => const CustomerListScreen(),),),);
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- Customer List -------------------------------------------------------///
            ListTile(
              leading: SvgPicture.asset(ImageAssets.iconHomeSVG, width: 23,),
              title: const Text('Customer List'),
              onTap: () {
                print("Customer List is Clicked");
                //Get.to(CustomerListScreen());
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListScreen(),),);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListForAddCustomer(),),);
                //Navigator.of(context).push(CustomRouteBuilder(MaterialPageRoute(builder: (context) => const CustomerListScreen(),),),);
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- Order Placement -----------------------------------------------------///
            // ListTile(
            //   leading: SvgPicture.asset(ImageAssets.iconTodayOrderIconSVG, width: 23,),
            //   title: const Text('Order Placement'),
            //   onTap: () {
            //     print("Order Placement");
            //     //Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderCustomerListScreen(),),);
            //   },
            // ),
            // Divider(
            //   height: 5,
            //   color: Colors.grey[300],
            // ),
            ///---------------------------------------- Leave Application ---------------------------------------------------///
            ListTile(
              leading: SvgPicture.asset(ImageAssets.iconHomeSVG, width: 23),
              title: const Text('Leave Application'),
              onTap: () {
                print("Leave Application");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),),);

                // Get.to(
                //       () => const LeaveApplicationScreen(),
                //   transition: Transition.fadeIn,
                //   //// FaceIn Animation normal Activity change
                //   duration: const Duration(seconds: 1),
                // );

              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- Password Change -----------------------------------------------------///
            // ListTile(
            //   leading: SvgPicture.asset(ImageAssets.iconPasswordChange2SVG, width: 23),
            //   title: const Text('Password Change'),
            //   onTap: () {
            //     print("Password Change is Clicked");
            //     //Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordChangeScreen(),),);
            //     // Add navigation or functionality for password change here
            //   },
            // ),
            // Divider(
            //   height: 5,
            //   color: Colors.grey[300],
            // ),
            ///---------------------------------------- Log Out -------------------------------------------------------------///
            ListTile(
              leading: SvgPicture.asset(ImageAssets.iconHomeSVG, width: 23,),
              title: const Text('Log Out'),
              onTap: () async {
                print("Log Out is Clicked");

                _logOutFunctionCall();

                //await AuthUtility.clearUserInfo();
                // if (mounted) {
                //   Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => const LoginScreen()),
                //         (route) => false,
                //   );
                // }
                // Add functionality for logging out here
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}


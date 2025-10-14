
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../screens/home/faq_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/tutorial_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_assets.dart';


class CustomDrawerSecond extends StatefulWidget {
  @override
  State<CustomDrawerSecond> createState() => _CustomDrawerSecondState();
}

class _CustomDrawerSecondState extends State<CustomDrawerSecond> {

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



                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.transparent, // optional
                            child: ClipOval(
                              child: Image.asset(
                                ImageAssets.deltaLPGLogoPNG,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )





                        // child: const CircleAvatar(
                        //   //backgroundColor: Colors.redAccent[100],
                        //
                        //   radius: 40.0,
                        //   // child: Image.asset(
                        //   //   ImageAssets.imageDemoProfilePNG,
                        //   //   height: 60,
                        //   // ),
                        //
                        //   backgroundImage: AssetImage(
                        //     //ImageAssets.imageDemoProfilePNG,
                        //     ImageAssets.deltaLPGLogoPNG,
                        //     //height: 60,
                        //   ),
                        // ),




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
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconHomeSVG, width: 23),
              // title: const Text('Home'),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ///---------------------------------------- Tutorial -----------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconTutorialsSVG, width: 23),
              // title: const Text('Tutorial'),
              title: const Text(
                'Tutorial',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),

              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TutorialScreen()),
                );
              },
            ),
            ///---------------------------------------- FAQ -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconFaqSVG, width: 23),
              // title: const Text('FAQ'),
              title: const Text(
                'FAQ',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FaqScreen()),
                );
              },
            ),
            ///---------------------------------------- About Us -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconAboutUsSVG, width: 20),
              // title: const Text('About Us'),
              title: const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ///---------------------------------------- Safety Guide Line -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconSafetyGuideLineSVG, width: 20),
              // title: const Text('Safety Guide Line'),
              title: const Text(
                'Safety Guide Line',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ///---------------------------------------- Return & Refund Policy -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconReturnRefundPolicySVG, width: 25),
              // title: const Text('Return & Refund Policy'),
              title: const Text(
                'Return & Refund Policy',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ///---------------------------------------- Delivery Charge Policy -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconDeliveryChargePolicySVG, width: 23),
              // title: const Text('Delivery Charge Policy'),
              title: const Text(
                'Delivery Charge Policy',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ///---------------------------------------- Contact Us -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconContactUsSVG, width: 21),
              // title: const Text('Contact Us'),
              title: const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ///---------------------------------------- Login -------------------------------------------------------------///
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: const VisualDensity(vertical: -4), // reduces height
              leading: SvgPicture.asset(ImageAssets.iconLoginSVG, width: 20),
              // title: const Text('Login'),
              title: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 13,   // 👈 sets text size
                ),
              ),
              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),








            Divider(
              height: 5,
              color: Colors.grey[300],
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

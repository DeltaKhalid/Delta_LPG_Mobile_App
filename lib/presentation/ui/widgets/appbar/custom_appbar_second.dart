import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/image_assets.dart';

class CustomAppbarSecond extends StatefulWidget {
  final String title;
  const CustomAppbarSecond({super.key, required this.title});
  @override
  State<CustomAppbarSecond> createState() => _CustomAppbarSecondState();
}



/// *** This is a custom AppBar widget, use for other screen which is not home screen. It has a back button and a title. *** ///






class _CustomAppbarSecondState extends State<CustomAppbarSecond> {

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
          //backgroundColor: AppColors.primaryColorRead,
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
          actions: [
            ///---------- Search Icon --------------------///
            // IconButton(
            //   onPressed: () async {
            //     //await AuthUtility.clearUserInfo();
            //     if (mounted) {
            //       _onBackButtonPress();
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
              onPressed: () => Navigator.pop(context),
              //icon: Icon(SvgPicture.asset(ImageAssets.homeIconSVG)),
              icon: SvgPicture.asset(
                //ImageAssets.logoutIcon2SVG,
                ImageAssets.iconBackArrow02SVG,
                width: 24,  // Adjust the width as needed
                height: 24, // Adjust the height as needed
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),


          ], systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
    );
  }
}

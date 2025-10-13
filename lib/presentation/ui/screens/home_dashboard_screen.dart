import 'package:delta_lpg_product_sale/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

import 'home/buy_lpg_screen.dart';
import 'home/lpg_accessories_screen.dart';
import 'home/safety_tips_screen.dart';
import 'home/safety_video_screen.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {


  /// ---------- Image Slider List ---------- ///
  final List<String> sliderImageList = [
    "assets/images/app_slider_img_02.png",
    "assets/images/app_slider_img_03.png",
    "assets/images/app_slider_img_04.png",
  ];

  /// ---------- Dashboard Items ---------- ///
  final List<Map<String, String>> dashboardItems = [
    {"icon": "assets/images/tutorial_icon.svg", "title": "Mobile CRM"},
    {"icon": "assets/images/tutorial_icon.svg", "title": "Tee Time"},
    {"icon": "assets/images/tutorial_icon.svg", "title": "Directory"},
    {"icon": "assets/images/tutorial_icon.svg", "title": "Calendar"},
  ];


  // final List<Map<String, dynamic>> dashboardItems = [
  //   {"icon": Icons.hub_outlined, "title": "Mobile CRM"},
  //   {"icon": Icons.golf_course, "title": "Tee Time"},
  //   {"icon": Icons.people_alt_outlined, "title": "Directory"},
  //   {"icon": Icons.calendar_month_outlined, "title": "Calendar"},
  //   {"icon": Icons.restaurant_menu, "title": "Dining Reservation"},
  //   {"icon": Icons.attach_money, "title": "Billing"},
  // ];



  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  /// ========================================================================== Scaffold Area ============================================= ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          /// ---------------------------------- Slider ----------------------------------------------------------- ///
          Container(
            height: 180,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider(
                  items: sliderImageList.map(
                        (path) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ).toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 180,
                    viewportFraction: 1,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() => _current = index);
                    },
                  ),
                ),

                // ডট ইন্ডিকেটর (Dot Indicator)
                Positioned(
                  bottom: 12,
                  child: Row(
                    children: List.generate(sliderImageList.length, (index) {
                      final active = _current == index;
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        child: Container(
                          width: active ? 12 : 8,
                          height: active ? 12 : 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: active ? Colors.green : Colors.grey,
                            color: Colors.green ,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          /// ---------------------------------- Dashboard Grid --------------------------------------------------- ///
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                /// ------------------ Left side ---------------- ///
                Expanded(
                    child: Column(
                      children: [
                        /// ------------------ Buy LPG ---------------- ///
                        GestureDetector(
                          onTap: () {
                            // Navigate to BuyLpgScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BuyLpgScreen()),
                            );
                          },
                          child: Container(
                            height: 150,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              // borderRadius: BorderRadius.circular(16),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/gas_bottle.svg', // path to your SVG file
                                    height: 27, // optional height
                                    width: 27,  // optional width
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    'Buy LPG', // your text here
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColorGreen
                                    ),
                                  ),
                          
                                ],
                              ),
                            ),
                          
                          
                          
                          ),
                        ),

                        SizedBox(
                          height: 3,
                        ),
                        /// ---------- LPG Accessories---------- ///
                        GestureDetector(
                          onTap: () {
                            // Navigate to BuyLpgScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LpgAccessoriesScreen()),
                            );
                          },
                          child: Container(
                            height: 150,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              // borderRadius: BorderRadius.circular(16),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/lpg_chula.svg', // path to your SVG file
                                    height: 27, // optional height
                                    width: 27,  // optional width
                                  ),

                                  SizedBox(height: 10,),

                                  Text(
                                    'LPG Accessories', // your text here
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColorGreen
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ),
                        ),
                      ],
                    )
                ),

                SizedBox(width: 3), // spacing between containers

                /// ------------------ Right side --------------- ///
                Expanded(
                    child: Column(
                      children: [
                        /// ---------- Safety Video ------------- ///
                        GestureDetector(
                          onTap: () {
                            // Navigate to BuyLpgScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SafetyVideoScreen()),
                            );
                          },

                          child: Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Container(
                              height: 150,
                              // color: Colors.amber,
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                // borderRadius: BorderRadius.circular(16),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/safety_video_02.svg', // path to your SVG file
                                      height: 27, // optional height
                                      width: 27,  // optional width
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      'Safety Video', // your text here
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3,),

                        /// ---------- Safety Tips of LPG ------------- ///
                        GestureDetector(
                          onTap: () {
                            // Navigate to BuyLpgScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SafetyTipsScreen()),
                            );
                          },
                          child: Container(
                            height: 150,
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              // borderRadius: BorderRadius.circular(16),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),

                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/safety_tips.svg', // path to your SVG file
                                    height: 27, // optional height
                                    width: 27,  // optional width
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    'Safety Tips of LPG', // your text here
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColorGreen
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  // child:
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
























// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class HomeDashboardScreen extends StatefulWidget {
//   const HomeDashboardScreen({super.key});
//
//   @override
//   State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
// }
//
// class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
//
//   // final List<String> imgList = [
//   //   'https://static.vecteezy.com/system/resources/previews/049/855/347/non_2x/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-photo.jpg',
//   //   'https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg',
//   //   'https://static.vecteezy.com/system/resources/previews/049/855/347/non_2x/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-photo.jpg'
//   //
//   //
//   // ];
//   //
//   // final themeMode = ValueNotifier(2);
//
//   List imageList = [
//     {"id": 1, "image_path": "https://static.vecteezy.com/system/resources/previews/049/855/347/non_2x/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-photo.jpg"},
//     {"id": 1, "image_path": "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg"},
//     {"id": 1, "image_path": "https://static.vecteezy.com/system/resources/previews/049/855/347/non_2x/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-photo.jpg"},
//   ];
//
//   final CarouselController carouselController = CarouselController();
//
//   int currentIndex = 0;
//
//
//
//
//
//
//
//
//   /// ================================================================== Scaffold Area =============================================== ///
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//
//         children: [
//
//           Stack(
//             children: [
//               InkWell(
//                 onTap: (){
//                   print(currentIndex);
//                 },
//                 child: CarouselSlider(items: imageList.map(
//                     (item) => Image.asset(
//                       item[
//                         item['image_path'],
//                         fit:BoxFit.cover,
//                         width
//                       ]
//                     )
//                 ), options: options),
//               )
//             ],
//           )
//
//
//
//         ],
//
//
//
//
//
//
//
//
//
//
//
//
//
//       ),
//     );
//   }
// }

import 'package:delta_lpg_product_sale/presentation/ui/screens/add_to_cart_screen.dart';
import 'package:delta_lpg_product_sale/presentation/ui/screens/favorite_product_screen.dart';
import 'package:delta_lpg_product_sale/presentation/ui/widgets/drawer/custom_drawer_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../home_dashboard_screen.dart';
import '../../utils/image_assets.dart';
import '../../widgets/appbar/custom_appbar.dart';
import 'knowledge_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ///===================== Bottom Navbar Item start ===============///
  int _currentIndex = 0;

  //final navigationKey = GlobalKey<CurvedNavigationBarState>();
  // int index = 2;

  int index = 0;
  final screen = [
    const HomeDashboardScreen(),
    const FavoriteProductScreen(),
    const AddToCartScreen(),
    const KnowledgeScreen(),
  ];


  /// Helper: tints the SVG teal when active, grey when inactive
  Widget _svgIcon(String assetPath, double width, int itemIndex) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      colorFilter: ColorFilter.mode(
        _currentIndex == itemIndex ? Colors.teal : Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }

  List<SalomonBottomBarItem> get _items => [
    /// Home
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconDashboardSVG, 23, 0),
      title: const Text("Dashboard"),
      selectedColor: Colors.teal,
    ),

    /// Achievements
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconAchievementSVG, 23, 1),
      title: const Text("Achievements"),
      selectedColor: Colors.teal,
    ),

    /// Cart
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconReportsSVG, 23, 2),
      title: const Text("Reports"),
      selectedColor: Colors.teal,
    ),

    /// Knowledge
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconKnowledge02SVG, 23, 3),
      title: const Text("Knowledge"),
      selectedColor: Colors.teal,
    ),

  ];



  // final navItems = [
  //   //const Icon(Icons.home, size: 20,),
  //
  //   //const ImageIcon(AssetImage(ImageAssets.iconHouseWhiteSVG), size: 20),
  //   SvgPicture.asset(ImageAssets.iconMenu3SVG, width: 20,),
  //
  //   //const ImageIcon(AssetImage(ImageAssets.iconAchievementPNG),),
  //   SvgPicture.asset(ImageAssets.iconMenu3SVG, width: 25,),
  //
  //   //const ImageIcon(AssetImage(ImageAssets.iconReportPNG),),
  //   SvgPicture.asset(ImageAssets.iconMenu3SVG, width: 20,),
  //
  //   //const ImageIcon(AssetImage(ImageAssets.iconKnowledgePNG),),
  //   // SvgPicture.asset(ImageAssets.iconKnowledge02NavSVG, width: 20,),
  // ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /// ------------------------------------- AppBar ------------------------------------------------------------------------- ///
      appBar: const CustomAppBar(title: 'Delta LPG',),

      /// ------------------------------------- Body ---------------------------------------------------------------------------- ///
      //body: screen[index],
      body: screen[_currentIndex],

      // body: Center(
      //   child: Text("Home Screen"),
      // ),

      /// ------------------------------------- Drawer -------------------------------------------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Navigating Bar New -------------------------------------------------------------- ///
      bottomNavigationBar: Card(
        elevation: 6,
        margin: const EdgeInsets.all(8.0),
        child: SalomonBottomBar(
          duration: const Duration(milliseconds: 220),
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          items: _items,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
        ),
      ),

    );
  }
}

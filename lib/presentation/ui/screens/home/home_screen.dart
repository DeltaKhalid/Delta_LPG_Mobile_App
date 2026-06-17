import 'package:delta_lpg_product_sale/presentation/ui/screens/add_to_cart_screen.dart';
import 'package:delta_lpg_product_sale/presentation/ui/screens/favorite_product_screen.dart';
import 'package:delta_lpg_product_sale/presentation/ui/widgets/drawer/custom_drawer_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../home_dashboard_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_assets.dart';
import '../../widgets/appbar/custom_appbar.dart';
import 'knowledge_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ///===================== Bottom Navbar Item start ===============///
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  //final navigationKey = GlobalKey<CurvedNavigationBarState>();
  // int index = 2;

  int index = 0;
  final screen = [
    const HomeDashboardScreen(),
    const AchievementScreen(),
    const ReportsScreen(),
    const KnowledgeScreen(),
  ];


  static const Color _activeColor = Color(0xFF03B55F);

  Widget _svgIcon(String assetPath, double width, int itemIndex) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      colorFilter: ColorFilter.mode(
        _currentIndex == itemIndex ? Colors.white : Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }

  List<SalomonBottomBarItem> get _items => [
    /// Home
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconDashboardSVG, 23, 0),
      title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
      selectedColor: _activeColor,
    ),

    /// Achievements
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconAchievementSVG, 23, 1),
      title: const Text("Achievements", style: TextStyle(color: Colors.white)),
      selectedColor: _activeColor,
    ),

    /// Cart
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconReportsSVG, 20, 2),
      title: const Text("Reports", style: TextStyle(color: Colors.white)),
      selectedColor: _activeColor,
    ),

    /// Knowledge
    SalomonBottomBarItem(
      icon: _svgIcon(ImageAssets.iconKnowledge02SVG, 23, 3),
      title: const Text("Knowledge", style: TextStyle(color: Colors.white)),
      selectedColor: _activeColor,
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
        color: Colors.white,
        child: SalomonBottomBar(
          duration: const Duration(milliseconds: 220),
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          selectedColorOpacity: 1.0,
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

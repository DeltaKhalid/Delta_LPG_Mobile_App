import 'package:delta_lpg_product_sale/presentation/ui/screens/add_to_cart_screen.dart';
import 'package:delta_lpg_product_sale/presentation/ui/screens/favorite_product_screen.dart';
import 'package:delta_lpg_product_sale/presentation/ui/widgets/drawer/custom_drawer_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../utils/image_assets.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/drawer/custom_drawer.dart';

import '../home_dashboard_screen.dart';

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
    // const KnowledgeScreen(),

  ];


  final _items = [
    /// Home
    SalomonBottomBarItem(
      //icon: const Icon(Icons.home),
      icon: SvgPicture.asset(ImageAssets.iconHomeSVG, width: 27,),
      //leading: SvgPicture.asset(ImageAssets.iconHome4SVG, width: 23,),
      title: const Text("Home"),

      //selectedColor: Colors.red,
      selectedColor: Colors.teal,
    ),

    /// Favorite
    SalomonBottomBarItem(
      //icon: const Icon(Icons.search),
      icon: SvgPicture.asset(ImageAssets.iconAddToFavoriteSVG, width: 27,),
      title: const Text("Favorite"),
      //selectedColor: Colors.orange,
      selectedColor: Colors.teal,
    ),

    /// Cart
    SalomonBottomBarItem(
      //icon: const Icon(Icons.favorite_border),
      icon: SvgPicture.asset(ImageAssets.iconShoppingCartSVG, width: 29,),
      title: const Text("My Cart"),
      //selectedColor: Colors.pink,
      selectedColor: Colors.teal,
    ),

    /// Knowledge
    // SalomonBottomBarItem(
    //   //icon: const Icon(Icons.person),
    //   icon: SvgPicture.asset(ImageAssets.iconMenu3SVG, width: 23,),
    //   title: const Text("Knowledge"),
    //   selectedColor: Colors.teal,
    // ),

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
          duration: const Duration(seconds: 1),
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

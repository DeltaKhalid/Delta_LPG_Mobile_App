import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class SettingsActivity extends StatelessWidget {
  const SettingsActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ------------------------------------- AppBar ------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbarSecond(title: 'Settings'),
      ),

      /// ------------------------------------- Drawer ------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------- ///
      body: const Center(
        child: Text(
          'This is Settings Activity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
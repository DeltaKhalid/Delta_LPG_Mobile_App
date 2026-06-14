import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class CollectionActivity extends StatelessWidget {
  const CollectionActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ------------------------------------- AppBar ------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbarSecond(title: 'Collection'),
      ),

      /// ------------------------------------- Drawer ------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------- ///
      body: const Center(
        child: Text(
          'This is Collection Activity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
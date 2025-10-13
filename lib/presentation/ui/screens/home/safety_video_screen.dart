import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class SafetyVideoScreen extends StatefulWidget {
  const SafetyVideoScreen({super.key});

  @override
  State<SafetyVideoScreen> createState() => _SafetyVideoScreenState();
}

class _SafetyVideoScreenState extends State<SafetyVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ------------------------------------- AppBar ------------------------------------------------------------------------- ///
      appBar: const CustomAppBar(title: 'Delta LPG',),

      /// ------------------------------------- Drawer ------------------------------------------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------------------------------------------- ///
      body: SafeArea(
        child: Column(
          children: [
            Expanded(  // Expands the container to take full available space
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Center(child: Text('This is Safety Video Screen.'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

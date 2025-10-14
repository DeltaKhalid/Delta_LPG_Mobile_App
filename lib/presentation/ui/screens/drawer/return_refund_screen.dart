import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class ReturnRefundScreen extends StatefulWidget {
  const ReturnRefundScreen({super.key});

  @override
  State<ReturnRefundScreen> createState() => _ReturnRefundScreenState();
}

class _ReturnRefundScreenState extends State<ReturnRefundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ------------------------------------- AppBar ------------------------------------------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // set your appbar height
        child: CustomAppbarSecond(title: 'Return & Refund'),
      ),

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
                    Center(child: Text('This is Return & Refund Screen.'))
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

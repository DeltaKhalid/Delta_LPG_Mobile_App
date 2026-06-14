import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class AttendanceActivity extends StatelessWidget {
  const AttendanceActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ------------------------------------- AppBar ------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbarSecond(title: 'Attendance'),
      ),

      /// ------------------------------------- Drawer ------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------- ///
      body: const Center(
        child: Text(
          'This is Attendance Activity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
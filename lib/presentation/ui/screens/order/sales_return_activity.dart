import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class SalesReturnActivity extends StatelessWidget {
  const SalesReturnActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbarSecond(title: 'Sales Return'),
      ),
      drawer: CustomDrawerSecond(),
      body: const Center(
        child: Text(
          'This is Sales Return Activity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
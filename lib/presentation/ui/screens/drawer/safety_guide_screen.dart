import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class SafetyGuideScreen extends StatefulWidget {
  const SafetyGuideScreen({super.key});

  @override
  State<SafetyGuideScreen> createState() => _SafetyGuideScreenState();
}

class _SafetyGuideScreenState extends State<SafetyGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ------------------------------------- AppBar ------------------------------------------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // set your appbar height
        child: CustomAppbarSecond(title: 'Safety Guide'),
      ),

      /// ------------------------------------- Drawer ------------------------------------------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------------------------------------------- ///
      backgroundColor: const Color(0xFFE8ECF7), // light gradient base
      body: Stack(
        children: [
          // 🔹 Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFD7E3FC),
                  Color(0xFFE8ECF7),
                ],
              ),
            ),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          // 🔹 Foreground Content
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20), // space from top
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // small top indicator
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          width: 60,
                          height: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Title
                    Center(
                      child: Text(
                        "LPG Safety Guideline",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Description
                    Text(
                      "We are a team of passionate professionals dedicated to "
                          "building innovative and high-quality digital products. "
                          "Our goal is to make technology simple, accessible, and impactful.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),




      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       Expanded(  // Expands the container to take full available space
      //         child: Container(
      //           width: double.infinity,
      //           padding: const EdgeInsets.only(left: 10, right: 10),
      //           margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(10.0),
      //           ),
      //           child: Column(
      //             children: [
      //               Center(child: Text('This is Safety Guide Screen.'))
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),




    );
  }
}

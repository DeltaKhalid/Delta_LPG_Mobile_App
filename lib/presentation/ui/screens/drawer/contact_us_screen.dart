import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ------------------------------------- AppBar ------------------------------------------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // set your appbar height
        child: CustomAppbarSecond(title: 'Contact Us'),
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
                  children: [
                    // small top indicator
                    const Center(
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
                    const Center(
                      child: Text(
                        "Our Office Addres",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Description
                    const Text(
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

                    Container(
                      width: 160,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb', // demo image
                                  width: double.infinity,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 8,
                                bottom: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '\$135.00',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '15 Stocks Left',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 15),
                                    SizedBox(width: 2),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      '(201)',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'FORM Smart Swim\nGoggles 2',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )



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
      //               Center(child: Text('This is Contact Us Screen.'))
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

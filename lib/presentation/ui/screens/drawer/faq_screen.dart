import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  // List of FAQs
  final List<Map<String, String>> faqs = [
    {
      'question': 'What is LPG??',
      'answer':
      'Liquefied petroleum gas (also called LPG, GPL, LP Gas, or autogas) is a mixture of hydrocarbon gases used as a fuel in heating appliances '
          'and vehicles, and increasingly replacing chlorofluorocarbons as an aerosol propellant and a refrigerant to reduce damage to the ozone '
          'layer, inferring that it is flammable. Varieties of LPG bought and sold include mixes that are primarily propane, mixes that are '
          'primarily butane, and the more common, mixes including both propane (60%) and butane (40%), depending on the season—in winter more '
          'propane, in summer more butane. Propylene and butylenes are usually also present in small concentration. A powerful odorant, '
          'ethanethiol, is added so that leaks can be detected easily. The international standard is EN 589. In the United States, '
          'thiophene or amyl mercaptan are also approved odorants.'
    },
    {
      'question': 'What is LPG Dispenser?',
      'answer':
      'LPG Dispenser is a machine which makes filling of specific volume of Liquid Petroleum Gas by pulsing a side channel, vane or submersible '
          'LPG pump,,one or more times, until the total volume of liquid required has been pumped. There are mainly there types of LPG dispensers '
          'according to their measuring methods.'
    },
    {
      'question': 'What is the working pressure of a LPG dispenser?',
      'answer':
      'LPG gas is in liquid state over 6 bars. So our systems are designed to work only over 6 bars. Under normal conditions working pressure is between 9-12 Bars.'
    },
    {
      'question': 'Can we make calibration for LPG Dispenser?',
      'answer':
      'Yes, calibration can be performed using standard procedures and certified equipment.'
    },
    {
      'question': 'What is the lifetime of a LPG meter?',
      'answer':
      'LPG meters generally last 5–10 years depending on usage and maintenance.'
    },
    {
      'question': 'When filters of LPG Dispenser should be cleaned?',
      'answer':
      'After 30.000lt. you should change the first filter. In every 100.000lt. '
          'de second filter should be changed. It is also important to make calibration '
          'every time you change filters.'
    },
    {
      'question': 'What is Automatic Temperature Compensation (ATC)?',
      'answer':
      'A liquid is subject to expansion or shrinkage resulting from temperature changes. Since LPG is liquid, '
          'volume also changes due to temperature. ATC is the technology correcting the measured volume '
          'automatically in function of the measured temperature. In conformity with the European Metrological '
          'Standards the volume is converted into litres to the standard reference temperature of 15°C. In this '
          'way your dispenser will take into account the volume changes as a result of the temperature '
          'fluctuations and you can sell the total volume you have purchased. With ATC the ‘lost litres’'
          ' belong to the past and you will have an incontestable control of your stock.'
    },
  ];

  // Track which tiles are expanded
  late List<bool> expandedList;

  @override
  void initState() {
    super.initState();
    expandedList = List.filled(faqs.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ------------------------------------- AppBar ------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbarSecond(title: 'FAQ'),
      ),

      /// ------------------------------------- Drawer ------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------- ///
      backgroundColor: const Color(0xFFE8ECF7),
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
          ),

          // 🔹 Foreground Content
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 80,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Title
                    const Center(
                      child: Text(
                        "FAQ",
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
                    const SizedBox(height: 20),

                    // 🔹 Scrollable FAQ List
                    Expanded(
                      child: ListView.builder(
                        itemCount: faqs.length,
                        itemBuilder: (context, index) {
                          final item = faqs[index];
                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ExpansionTile(
                              key: Key(index.toString()),
                              initiallyExpanded: expandedList[index],
                              onExpansionChanged: (expanded) {
                                setState(() {
                                  expandedList[index] = expanded;
                                });
                              },
                              trailing: Icon(
                                expandedList[index]
                                    ? Icons.remove_circle
                                    : Icons.add_circle,
                                color: Colors.teal,
                              ),
                              title: Text(
                                item['question']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    item['answer']!,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


















// import 'package:flutter/material.dart';
//
// import '../../widgets/appbar/custom_appbar_second.dart';
// import '../../widgets/drawer/custom_drawer_second.dart';
//
// class FaqScreen extends StatefulWidget {
//   const FaqScreen({super.key});
//
//   @override
//   State<FaqScreen> createState() => _FaqScreenState();
// }
//
// class _FaqScreenState extends State<FaqScreen> {
//
//   // List of FAQs
//   final List<Map<String, String>> faqs = [
//     {
//       'question': 'What is Flutter?',
//       'answer':
//       'Flutter is an open-source UI framework by Google for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.'
//     },
//     {
//       'question': 'How does Flutter work?',
//       'answer':
//       'Flutter uses the Dart programming language and its own rendering engine to draw widgets directly to the screen, which makes apps fast and customizable.'
//     },
//     {
//       'question': 'Is Flutter free to use?',
//       'answer':
//       'Yes! Flutter is completely free and open-source, supported by Google and the community.'
//     },
//     {
//       'question': 'Can I use Flutter for web development?',
//       'answer':
//       'Yes. Flutter supports building responsive web applications using the same Dart codebase as mobile apps.'
//     },
//   ];
//
//   // Track which tiles are expanded
//   List<bool> expandedList = [];
//
//
//   /// ------------------ init State --------------- ///
//   @override
//   void initState() {
//     super.initState();
//     expandedList = List.filled(faqs.length, false);
//   }
//
//
//
//   ///========================================================= Scaffold Area =================================================== ///
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       /// ------------------------------------- AppBar ------------------------------------------------------------------------- ///
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60.0), // set your appbar height
//         child: CustomAppbarSecond(title: 'FAQ'),
//       ),
//
//       /// ------------------------------------- Drawer ------------------------------------------------------------------------- ///
//       drawer: CustomDrawerSecond(),
//
//       /// ------------------------------------- Body --------------------------------------------------------------------------- ///
//       backgroundColor: const Color(0xFFE8ECF7), // light gradient base
//       body: Stack(
//         children: [
//           // 🔹 Gradient Background
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xFFD7E3FC),
//                   Color(0xFFE8ECF7),
//                 ],
//               ),
//             ),
//             child: Container(
//               width: double.infinity,
//               margin: const EdgeInsets.only(top: 20),
//               child: Text(
//                 "",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//           ),
//
//           // 🔹 Foreground Content
//           Align(
//             alignment: Alignment.topCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20), // space from top
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 1,
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(50),
//                     topLeft: Radius.circular(50),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12.withOpacity(0.1),
//                       blurRadius: 15,
//                       offset: const Offset(0, 8),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // small top indicator
//                     const Center(
//                       child: Padding(
//                         padding: EdgeInsets.only(bottom: 16),
//                         child: SizedBox(
//                           width: 60,
//                           height: 5,
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               color: Color(0xFFF0F0F0),
//                               borderRadius: BorderRadius.all(Radius.circular(20)),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // Title
//                     const Center(
//                       child: Text(
//                         "FAQ",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//
//                     // Description
//                     const Text(
//                       "We are a team of passionate professionals dedicated to "
//                           "building innovative and high-quality digital products. "
//                           "Our goal is to make technology simple, accessible, and impactful.",
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(
//                         fontSize: 15,
//                         height: 1.5,
//                         color: Colors.black54,
//                       ),
//                     ),
//
//
//                     ListView.builder(
//                       itemCount: faqs.length,
//                       padding: const EdgeInsets.all(16),
//                       itemBuilder: (context, index) {
//                         final item = faqs[index];
//                         return Card(
//                           elevation: 3,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           margin: const EdgeInsets.only(bottom: 12),
//                           child: ExpansionTile(
//                             key: Key(index.toString()),
//                             initiallyExpanded: expandedList[index],
//                             onExpansionChanged: (expanded) {
//                               setState(() {
//                                 expandedList[index] = expanded;
//                               });
//                             },
//                             trailing: Icon(
//                               expandedList[index]
//                                   ? Icons.remove_circle
//                                   : Icons.add_circle,
//                               color: Colors.teal,
//                             ),
//                             title: Text(
//                               item['question']!,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             children: [
//                               Padding(
//                                 padding:
//                                 const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                 child: Text(
//                                   item['answer']!,
//                                   textAlign: TextAlign.justify,
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black54,
//                                     height: 1.5,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//
//
//
//
//
//
//
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//
//
//
//
//
//
//
//
//
//
//
//       // body: SafeArea(
//       //   child: Column(
//       //     children: [
//       //       Expanded(  // Expands the container to take full available space
//       //         child: Container(
//       //           width: double.infinity,
//       //           padding: const EdgeInsets.only(left: 10, right: 10),
//       //           margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
//       //           decoration: BoxDecoration(
//       //             color: Colors.white,
//       //             borderRadius: BorderRadius.circular(10.0),
//       //           ),
//       //           child: Column(
//       //             children: [
//       //               Center(child: Text('This is FAQ Screen.'))
//       //             ],
//       //           ),
//       //         ),
//       //       )
//       //     ],
//       //   ),
//       // ),
//
//
//
//
//     );
//   }
//
//
//   Widget faqTile(String question, String answer) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 1,
//       child: ExpansionTile(
//         title: Text(
//           question,
//           style: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 15,
//           ),
//         ),
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               answer,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.black54,
//                 height: 1.5,
//               ),
//               textAlign: TextAlign.justify,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
// }

import 'package:delta_lpg_product_sale/presentation/ui/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  static const List<_DashboardTileData> _tiles = [
    _DashboardTileData(

      iconAsset: ImageAssets.iconAttendance07SVG,
      iconSize: 45,   // ← bump up until it visually matches
      title: 'Attendance',
      subtitle: '',


      // iconAsset: ImageAssets.iconAttendance06SVG,
      //
      // // iconAsset: 'assets/images/attendance_icon.svg',
      // title: 'Attendance',
      // subtitle: '',
    ),
    _DashboardTileData(
      // iconAsset: 'assets/images/attendance_icon_03.svg',
      iconAsset: ImageAssets.iconLeaveSVG,
      // icon: Icons.ac_unit,
      title: 'Leave',
      subtitle: '',
    ),
    _DashboardTileData(
      // icon: Icons.power_outlined,
      //iconAsset: 'assets/images/attendance_icon_04.svg',
      iconAsset: ImageAssets.iconOrderSVG,


      title: 'Order',
      subtitle: '',
    ),
    _DashboardTileData(
      iconAsset: ImageAssets.iconCollectionSVG,
      // icon: Icons.videocam_outlined,

      title: 'Collection',
      subtitle: '',
    ),
    _DashboardTileData(
      icon: Icons.water_drop_outlined,
      title: 'Water',
      subtitle: '',
    ),
    _DashboardTileData(
      icon: Icons.electrical_services_outlined,
      title: 'Socket',
      subtitle: '',
    ),
    _DashboardTileData(
      icon: Icons.garage_outlined,
      title: 'Garage',
      subtitle: '',
    ),
    _DashboardTileData(
      icon: Icons.window_outlined,
      title: 'Window',
      subtitle: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Column(
          children: [
            _ProfileCard(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount: _tiles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) => _DashboardTile(
                    data: _tiles[index],
                    index: index,
                    totalCount: _tiles.length,
                  ),
                ),
              ),
            ),

            // Expanded(
            //
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: _tiles.length,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       childAspectRatio: 1.0,
            //       crossAxisSpacing: 0,
            //       mainAxisSpacing: 0,
            //     ),
            //     itemBuilder: (context, index) => _DashboardTile(
            //       data: _tiles[index],
            //       index: index,
            //       totalCount: _tiles.length,
            //     ),
            //   ),
            //
            //   // child: GridView.builder(
            //   //   padding: const EdgeInsets.all(12),
            //   //   itemCount: _tiles.length,
            //   //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   //     crossAxisCount: 2,
            //   //     crossAxisSpacing: 0,
            //   //     mainAxisSpacing: 0,
            //   //     childAspectRatio: 1.02,
            //   //   ),
            //   //   itemBuilder: (context, index) {
            //   //     final tile = _tiles[index];
            //   //     return _DashboardTile(
            //   //       data: tile,
            //   //       isLeftColumn: index.isEven,
            //   //     );
            //   //   },
            //   // ),
            //
            //
            // ),

          ],
        ),
      ),
    );
  }
}

/// --------------- Data model for dashboard tiles, containing icon, title, and subtitle information ------------------ ///
class _DashboardTileData {
  const _DashboardTileData({
    this.icon,
    this.iconAsset,
    this.iconSize = 38,
    required this.title,
    required this.subtitle,
  }) : assert(icon != null || iconAsset != null, 'Provide icon or iconAsset');

  final IconData? icon;
  final String? iconAsset;
  final double iconSize;
  final String title;
  final String subtitle;
}

class _DashboardTile extends StatelessWidget {
  const _DashboardTile({
    required this.data,
    required this.index,
    required this.totalCount,
  });

  final _DashboardTileData data;
  final int index;
  final int totalCount;

  BorderRadius _borderRadius() {
    const r = Radius.circular(16);
    final isFirstRow = index < 2;
    final isLastRow  = index >= totalCount - 2;
    final isLeft     = index.isEven;
    final isRight    = index.isOdd;

    return BorderRadius.only(
      topLeft:     (isFirstRow && isLeft)  ? r : Radius.zero,
      topRight:    (isFirstRow && isRight) ? r : Radius.zero,
      bottomLeft:  (isLastRow  && isLeft)  ? r : Radius.zero,
      bottomRight: (isLastRow  && isRight) ? r : Radius.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: _borderRadius(),
        border: Border(
          left: index.isEven
              ? const BorderSide(color: Color(0xFFE2E2E2), width: 1)
              : BorderSide.none,
          right:  const BorderSide(color: Color(0xFFE2E2E2), width: 1),
          top:    const BorderSide(color: Color(0xFFE2E2E2), width: 1),
          bottom: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
        ),
      ),
      child: InkWell(
        borderRadius: _borderRadius(),
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (data.iconAsset != null)
                SvgPicture.asset(
                  data.iconAsset!,
                  width: data.iconSize,
                  height: data.iconSize,
                  fit: BoxFit.contain,
                )
              else
                Icon(
                  data.icon,
                  size: 35,
                  color: const Color(0xFF62748E),
                ),
              const SizedBox(height: 12),
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF62748E),
                  letterSpacing: 0.3,
                ),
              ),
              if (data.subtitle.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9A9A9A),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}



// class _DashboardTileData {
//   const _DashboardTileData({
//     this.icon,
//     this.iconAsset,
//     this.iconSize = 38,         // ← add this
//     required this.title,
//     required this.subtitle,
//   }) : assert(icon != null || iconAsset != null, 'Provide icon or iconAsset');
//
//   final IconData? icon;
//   final String? iconAsset;
//   final double iconSize;        // ← add this
//   final String title;
//   final String subtitle;
// }

// class _DashboardTile extends StatelessWidget {
//   const _DashboardTile({
//     required this.data,
//     required this.isLeftColumn,
//   });
//
//   final _DashboardTileData data;
//   final bool isLeftColumn;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: const Radius.circular(16),
//           topRight: const Radius.circular(16),     // ← adjust per your grid layout
//           bottomLeft: Radius.circular(16),
//           bottomRight: const Radius.circular(16),
//         ),
//
//
//
//         // decoration: BoxDecoration(
//         //   color: Colors.white,
//         //   borderRadius: BorderRadius.only(
//         //     topLeft: isLeftColumn ? const Radius.circular(8) : Radius.zero,
//         //     topRight: const Radius.circular(8),     // ← adjust per your grid layout
//         //     bottomLeft: isLeftColumn ? const Radius.circular(8) : Radius.zero,
//         //     bottomRight: const Radius.circular(8),
//         //   ),
//
//         border: Border(
//           left: isLeftColumn
//               ? const BorderSide(color: Color(0xFFE2E2E2), width: 1)
//               : BorderSide.none,
//           right: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//           top: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//           bottom: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//         ),
//       ),
//
//
//       // decoration: BoxDecoration(
//       //   color: Colors.white,
//       //   border: Border(
//       //     left: isLeftColumn
//       //         ? const BorderSide(color: Color(0xFFE2E2E2), width: 1)
//       //         : BorderSide.none,
//       //     right: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//       //     top: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//       //     bottom: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//       //   ),
//       // ),
//
//       child: InkWell(
//         onTap: () {},
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//
//             if (data.iconAsset != null)
//                 SvgPicture.asset(
//                 data.iconAsset!,
//                 width: data.iconSize,
//                 height: data.iconSize,
//                 fit: BoxFit.contain,
//               )
//
//               // if (data.iconAsset != null)
//               //   SizedBox(
//               //     width: 40,
//               //     height: 40,
//               //     child: SvgPicture.asset(
//               //       data.iconAsset!,
//               //       width: 40,
//               //       height: 40,
//               //       fit: BoxFit.contain,
//               //     ),
//               //   )
//
//
//               // if (data.iconAsset != null)
//               //   SvgPicture.asset(
//               //     data.iconAsset!,
//               //     width: 35,
//               //     height: 35,
//               //
//               //     // colorFilter: const ColorFilter.mode(
//               //     //   Color(0xFF111111),
//               //     //   BlendMode.srcIn,
//               //     // ),
//               //   )
//
//
//               else
//                 Icon(
//                   data.icon,
//                   size: 35,
//                   color: const Color(0xFF62748E),
//                 ),
//               const SizedBox(height: 12),
//               Text(
//                 data.title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF62748E),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//               if (data.subtitle.isNotEmpty) ...[
//                 const SizedBox(height: 4),
//                 Text(
//                   data.subtitle,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF9A9A9A),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


/// --------------- Data model for dashboard tiles, containing icon, title, and subtitle information ------------------ ///
// class _DashboardTileData {
//   const _DashboardTileData({
//     this.icon,
//     this.iconAsset,
//     required this.title,
//     required this.subtitle,
//   }) : assert(icon != null || iconAsset != null, 'Provide icon or iconAsset');
//
//   final IconData? icon;
//   final String? iconAsset;
//   final String title;
//   final String subtitle;
// }
//
// class _DashboardTile extends StatelessWidget {
//   const _DashboardTile({
//     required this.data,
//     required this.isLeftColumn,
//   });
//
//   final _DashboardTileData data;
//   final bool isLeftColumn;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(16),
//             topRight: const Radius.circular(16),     // ← adjust per your grid layout
//             bottomLeft: Radius.circular(16),
//             bottomRight: const Radius.circular(16),
//           ),
//
//
//
//       // decoration: BoxDecoration(
//       //   color: Colors.white,
//       //   borderRadius: BorderRadius.only(
//       //     topLeft: isLeftColumn ? const Radius.circular(8) : Radius.zero,
//       //     topRight: const Radius.circular(8),     // ← adjust per your grid layout
//       //     bottomLeft: isLeftColumn ? const Radius.circular(8) : Radius.zero,
//       //     bottomRight: const Radius.circular(8),
//       //   ),
//
//         border: Border(
//           left: isLeftColumn
//               ? const BorderSide(color: Color(0xFFE2E2E2), width: 1)
//               : BorderSide.none,
//           right: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//           top: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//           bottom: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//         ),
//       ),
//
//
//       // decoration: BoxDecoration(
//       //   color: Colors.white,
//       //   border: Border(
//       //     left: isLeftColumn
//       //         ? const BorderSide(color: Color(0xFFE2E2E2), width: 1)
//       //         : BorderSide.none,
//       //     right: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//       //     top: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//       //     bottom: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
//       //   ),
//       // ),
//
//       child: InkWell(
//         onTap: () {},
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//
//               if (data.iconAsset != null)
//                 SizedBox(
//                   width: 40,
//                   height: 40,
//                   child: SvgPicture.asset(
//                     data.iconAsset!,
//                     width: 40,
//                     height: 40,
//                     fit: BoxFit.contain,
//                   ),
//                 )
//
//
//               // if (data.iconAsset != null)
//               //   SvgPicture.asset(
//               //     data.iconAsset!,
//               //     width: 35,
//               //     height: 35,
//               //
//               //     // colorFilter: const ColorFilter.mode(
//               //     //   Color(0xFF111111),
//               //     //   BlendMode.srcIn,
//               //     // ),
//               //   )
//
//
//               else
//                 Icon(
//                   data.icon,
//                   size: 35,
//                   color: const Color(0xFF62748E),
//                 ),
//               const SizedBox(height: 12),
//               Text(
//                 data.title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF62748E),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//               if (data.subtitle.isNotEmpty) ...[
//                 const SizedBox(height: 4),
//                 Text(
//                   data.subtitle,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF9A9A9A),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/// --------------- Profile card widget displaying user information and attendance times ------------------ ///
class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Avatar with online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFF5B7FA6),
                  child: const Text(
                    'M',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 14),

            // Name + User ID
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(text: ''),
                        TextSpan(
                          text: 'Md.Shohel Miah',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'USER  ID: 000001',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),

            // Attendance Time
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Start Time
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.access_time, size: 13, color: Color(0xFF5B7FA6)),
                      SizedBox(width: 5),
                      Text(
                        'Start : 09:00 AM',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5B7FA6),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // End Time
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.access_time_filled, size: 13, color: Color(0xFF5B7FA6)),
                      SizedBox(width: 5),
                      Text(
                        'End   : 18:00 PM',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5B7FA6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}



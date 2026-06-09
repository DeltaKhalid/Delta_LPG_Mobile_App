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
      iconAsset: 'assets/images/attendance.svg',
      title: 'Attendance',
      subtitle: 'x5 devices',
    ),
    _DashboardTileData(
      icon: Icons.ac_unit,
      title: 'Leave',
      subtitle: 'x3 devices',
    ),
    _DashboardTileData(
      icon: Icons.power_outlined,
      title: 'Order',
      subtitle: 'x5 devices',
    ),
    _DashboardTileData(
      icon: Icons.videocam_outlined,
      title: 'Collection',
      subtitle: 'x3 devices',
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
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _tiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1.02,
                ),
                itemBuilder: (context, index) {
                  final tile = _tiles[index];
                  return _DashboardTile(
                    data: tile,
                    isLeftColumn: index.isEven,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardTileData {
  const _DashboardTileData({
    this.icon,
    this.iconAsset,
    required this.title,
    required this.subtitle,
  }) : assert(icon != null || iconAsset != null, 'Provide icon or iconAsset');

  final IconData? icon;
  final String? iconAsset;
  final String title;
  final String subtitle;
}

class _DashboardTile extends StatelessWidget {
  const _DashboardTile({
    required this.data,
    required this.isLeftColumn,
  });

  final _DashboardTileData data;
  final bool isLeftColumn;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: isLeftColumn
              ? const BorderSide(color: Color(0xFFE2E2E2), width: 1)
              : BorderSide.none,
          right: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
          top: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
          bottom: const BorderSide(color: Color(0xFFE2E2E2), width: 1),
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (data.iconAsset != null)
                SvgPicture.asset(
                  data.iconAsset!,
                  width: 35,
                  height: 35,
                  // colorFilter: const ColorFilter.mode(
                  //   Color(0xFF111111),
                  //   BlendMode.srcIn,
                  // ),
                )
              else
                Icon(
                  data.icon,
                  size: 35,
                  color: const Color(0xFF111111),
                ),
              const SizedBox(height: 12),
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222222),
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

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF00AA55),
              const Color(0xFF00CC77),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kamal Hossain',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Senier Executive',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class _ProfileCard extends StatelessWidget {
//   const _ProfileCard();
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(12),
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               const Color(0xFF00AA55),
//               const Color(0xFF00CC77),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 32,
//               backgroundColor: Colors.white.withValues(alpha: 0.3),
//               child: const Icon(
//                 Icons.person,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Elvis Obi',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     'Creative Writer',
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white.withValues(alpha: 0.9),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.close,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


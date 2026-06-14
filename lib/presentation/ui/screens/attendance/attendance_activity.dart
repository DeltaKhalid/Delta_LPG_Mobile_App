import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/image_assets.dart';
import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class AttendanceActivity extends StatelessWidget {
  const AttendanceActivity({super.key});

  static const List<String> _months = [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final monthLabel = _months[now.month];
    final daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);

    return Scaffold(

      /// ------------------------------------- AppBar ------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbarSecond(title: 'Attendance'),
      ),

      /// ------------------------------------- Drawer ------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------- ///
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///------------- Start Time & End Time Cards ----------------///
            Row(
              children: [
                Expanded(child: _buildTimeCard('Start Time', ImageAssets.iconAttendanceSVG)),
                const SizedBox(width: 12),
                Expanded(child: _buildTimeCard('End Time', ImageAssets.iconAttendance06SVG)),
              ],
            ),
            const SizedBox(height: 24),

            ///------------- Attendance Summary Heading -----------------///
            Text(
              'Attendance Summary : $monthLabel ${now.year} ($daysInMonth Days)',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            ///------------- Attendance Summary Table -------------------///
            _buildSummaryTable(),
            const SizedBox(height: 24),

            ///------------- Leave Status Heading ----------------------///
            const Text(
              'Leave Status',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            ///------------- Leave Status Table ------------------------///
            _buildLeaveTable(),

          ],
        ),
      ),
    );
  }

  ///============================================================///
  ///                     Time Card Widget                        ///
  ///============================================================///
  Widget _buildTimeCard(String label, String iconPath) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, width: 52, height: 52),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  ///============================================================///
  ///              Attendance Summary Table                       ///
  ///============================================================///
  Widget _buildSummaryTable() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Table(
        border: TableBorder.all(color: Colors.grey.shade300),
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            children: [
              _headerCell('Present'),
              _headerCell('Absent'),
              _headerCell('Late'),
            ],
          ),
          TableRow(
            children: [
              _valueCell('0'),
              _valueCell('0'),
              _valueCell('0'),
            ],
          ),
        ],
      ),
    );
  }

  ///============================================================///
  ///                 Leave Status Table                          ///
  ///============================================================///
  Widget _buildLeaveTable() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Table(
        border: TableBorder.all(color: Colors.grey.shade300),
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            children: [
              _headerCell('Casual'),
              _headerCell('Sick'),
              _headerCell('Others'),
            ],
          ),
          TableRow(
            children: [
              _leaveCell(),
              _leaveCell(),
              _leaveCell(),
            ],
          ),
        ],
      ),
    );
  }

  ///============================================================///
  ///                    Cell Helpers                             ///
  ///============================================================///
  Widget _headerCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _valueCell(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _leaveCell() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Allocated :',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          SizedBox(height: 6),
          Text(
            'Balance :',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
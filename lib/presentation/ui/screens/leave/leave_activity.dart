import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';

class LeaveActivity extends StatefulWidget {
  const LeaveActivity({super.key});

  @override
  State<LeaveActivity> createState() => _LeaveActivityState();
}

class _LeaveActivityState extends State<LeaveActivity> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _selectedLeaveType;
  final TextEditingController _purposeController = TextEditingController();

  static const List<String> _leaveTypes = [
    'Casual Leave',
    'Sick Leave',
    'Others',
  ];

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDate(BuildContext context, bool isFrom) async {
    final initial = isFrom ? (_fromDate ?? DateTime.now()) : (_toDate ?? _fromDate ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColorSecondShad02,
          ),
        ),
        child: child!,
      ),
    );
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        _fromDate = picked;
        if (_toDate != null && _toDate!.isBefore(picked)) _toDate = picked;
      } else {
        _toDate = picked;
      }
    });
  }

  @override
  void dispose() {
    _purposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ------------------------------------- AppBar ------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbarSecond(title: 'Leave'),
      ),

      /// ------------------------------------- Drawer ------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------- ///
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ///------------- From Date & To Date ----------------///
            Row(
              children: [
                Expanded(child: _buildDateField(context, isFrom: true)),
                const SizedBox(width: 12),
                Expanded(child: _buildDateField(context, isFrom: false)),
              ],
            ),
            const SizedBox(height: 12),

            ///------------- Select Leave Type ------------------///
            _buildLeaveTypeDropdown(),
            const SizedBox(height: 12),

            ///------------- Leave Info Grid --------------------///
            _buildInfoGrid(),
            const SizedBox(height: 12),

            ///------------- Leave Purpose Text Area ------------///
            _buildPurposeField(),
            const SizedBox(height: 24),

            ///------------- Submit Button ----------------------///
            _buildSubmitButton(),

          ],
        ),
      ),
    );
  }

  ///============================================================///
  ///                    Date Field                               ///
  ///============================================================///
  Widget _buildDateField(BuildContext context, {required bool isFrom}) {
    final DateTime? date = isFrom ? _fromDate : _toDate;
    final hasDate = date != null;
    final label = isFrom ? 'Start Date' : 'End Date';

    return GestureDetector(
      onTap: () => _pickDate(context, isFrom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.black54),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                hasDate ? _formatDate(date) : label,
                style: TextStyle(
                  fontSize: 13,
                  color: hasDate ? Colors.black87 : Colors.black45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///============================================================///
  ///                 Leave Type Dropdown                         ///
  ///============================================================///
  Widget _buildLeaveTypeDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedLeaveType,
          hint: const Center(
            child: Text(
              'Select Leave Type',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
          items: _leaveTypes.map((type) => DropdownMenuItem(
            value: type,
            child: Text(type, style: const TextStyle(fontSize: 14)),
          )).toList(),
          onChanged: (val) => setState(() => _selectedLeaveType = val),
        ),
      ),
    );
  }

  ///============================================================///
  ///                   Leave Info Grid                           ///
  ///============================================================///
  Widget _buildInfoGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _infoLabel('Allocated', ':')),
              Expanded(child: _infoLabel('Consumed', ':')),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _infoLabel('Pipe Line', ':')),
              Expanded(child: _infoLabel('Available', ':')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoLabel(String label, String separator) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 13, color: Colors.black87),
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(text: ' $separator'),
        ],
      ),
    );
  }

  ///============================================================///
  ///                  Purpose Text Field                         ///
  ///============================================================///
  Widget _buildPurposeField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 12),
            child: Icon(Icons.edit_note_outlined, size: 22, color: Colors.grey.shade400),
          ),
          Expanded(
            child: TextField(
              controller: _purposeController,
              maxLines: 4,
              maxLength: 250,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Write leave purpose ( less than 250 characters )',
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                counterText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///============================================================///
  ///                    Submit Button                            ///
  ///============================================================///
  Widget _buildSubmitButton() {
    return SizedBox(
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColorSecondShad02,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 0,
        ),
        child: const Text(
          'Submit',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
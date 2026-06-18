import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/appbar/custom_appbar_second.dart';
import '../../widgets/drawer/custom_drawer_second.dart';
import 'details_order_activity.dart';

// ─── Constants ────────────────────────────────────────────────────────────────

const _kAccent     = Color(0xFF0B8FAC);
const _kBg         = Color(0xFFF4F5FA);
const _kIdBadge    = Color(0xFF4A5568);
const _kCatBadge   = Color(0xFFE8ECF0);
const _kCatText    = Color(0xFF4A5568);
const _kNameText   = Color(0xFF1A202C);
const _kSubText    = Color(0xFF62748E);
const _kBorder     = Color(0xFFDDE3EA);
const _kDisabledBg = Color(0xFFF7F9FC);
const _kHint       = Color(0xFFADB5C2);
const _kDivider    = Color(0xFFEDF0F4);

const List<String> _kStates = ['Dhaka', 'Chittagong', 'Rajshahi', 'Sylhet', 'Khulna'];

// ─── Data model ───────────────────────────────────────────────────────────────

class _CustomerData {
  const _CustomerData({
    required this.id,
    required this.name,
    required this.category,
    required this.phone,
    required this.location,
    required this.state,
    required this.amount,
  });
  final String id;
  final String name;
  final String category;
  final String phone;
  final String location;
  final String state;
  final double amount;
}

// ─── Demo data ────────────────────────────────────────────────────────────────

const List<_CustomerData> _kCustomers = [
  // Dhaka
  _CustomerData(id: '000670',     name: 'GAZI GROCERY',            category: 'GROCERY',   phone: '0507566967', location: 'Mirpur, Dhaka',        state: 'Dhaka',      amount: 0.00),
  _CustomerData(id: 'CUS-000001', name: 'DAR BARIA FOOD STUFF TR', category: 'FOODSTUFF', phone: '555441101',  location: 'Gulshan, Dhaka',       state: 'Dhaka',      amount: 0.02),
  _CustomerData(id: 'CUS-000003', name: 'MAKKAH MARKETS TR.LL...', category: 'TRADING',   phone: '555441102',  location: 'Banani, Dhaka',        state: 'Dhaka',      amount: 3016.25),
  _CustomerData(id: 'CUS-000005', name: 'AL MADINA STORE',         category: 'GROCERY',   phone: '01712345678',location: 'Dhanmondi, Dhaka',     state: 'Dhaka',      amount: 150.00),
  // Chittagong
  _CustomerData(id: 'CUS-000010', name: 'PORT CITY TRADERS',       category: 'TRADING',   phone: '031234567',  location: 'Agrabad, Chittagong',  state: 'Chittagong', amount: 1200.00),
  _CustomerData(id: 'CUS-000011', name: 'CTGBD FOOD HOUSE',        category: 'FOODSTUFF', phone: '031987654',  location: 'Nasirabad, Chittagong', state: 'Chittagong', amount: 540.75),
  // Rajshahi
  _CustomerData(id: 'CUS-000012', name: 'HIGHLAND MART',           category: 'GROCERY',   phone: '503456789',  location: 'Rajshahi',             state: 'Rajshahi',   amount: 250.00),
  _CustomerData(id: 'CUS-000013', name: 'SILK CITY STORE',         category: 'TRADING',   phone: '0721234567', location: 'Shaheb Bazar, Rajshahi',state: 'Rajshahi',   amount: 875.00),
  // Sylhet
  _CustomerData(id: 'CUS-000020', name: 'TEA GARDEN STORE',        category: 'FOODSTUFF', phone: '0821234567', location: 'Zindabazar, Sylhet',    state: 'Sylhet',     amount: 450.00),
  _CustomerData(id: 'CUS-000021', name: 'SURMA VALLEY MART',       category: 'GROCERY',   phone: '0829876543', location: 'Amberkhana, Sylhet',    state: 'Sylhet',     amount: 310.50),
  // Khulna
  _CustomerData(id: 'CUS-000030', name: 'SUNDARBAN MART',          category: 'GROCERY',   phone: '041234567',  location: 'Khalishpur, Khulna',    state: 'Khulna',     amount: 680.00),
  _CustomerData(id: 'CUS-000031', name: 'MONGLA TRADERS',          category: 'TRADING',   phone: '041987654',  location: 'Daulatpur, Khulna',     state: 'Khulna',     amount: 1450.00),
];

// ─── Activity ─────────────────────────────────────────────────────────────────

class OrderActivity extends StatefulWidget {
  const OrderActivity({super.key});

  @override
  State<OrderActivity> createState() => _OrderActivityState();
}

class _OrderActivityState extends State<OrderActivity> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _searchQuery   = '';
  String _selectedState = '';
  bool   _showDropdown  = false;

  List<_CustomerData> get _filtered {
    var list = _kCustomers;
    if (_selectedState.isNotEmpty) {
      list = list.where((c) => c.state == _selectedState).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list.where((c) =>
        c.id.toLowerCase().contains(q) || c.name.toLowerCase().contains(q)
      ).toList();
    }
    return list;
  }

  void _selectState(String state) {
    setState(() {
      _selectedState = state;
      _showDropdown  = false;
    });
  }

  void _clearState() {
    setState(() {
      _selectedState = '';
      _showDropdown  = false;
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_showDropdown) setState(() => _showDropdown = false);
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: _kBg,

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: CustomAppbarSecond(title: 'Order'),
        ),

        drawer: CustomDrawerSecond(),

        body: Column(
          children: [
            _buildFilterCard(),
            Expanded(
              child: _filtered.isEmpty
                  ? const Center(
                      child: Text('No customers found', style: TextStyle(color: _kSubText)),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      itemCount: _filtered.length,
                      itemBuilder: (_, i) => _CustomerCard(data: _filtered[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Filter card ────────────────────────────────────────────────────────────

  Widget _buildFilterCard() {
    final stateSelected = _selectedState.isNotEmpty;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ── STATE ──────────────────────────────────────────────────────────
          _sectionLabel(Icons.public, 'STATE'),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => setState(() => _showDropdown = !_showDropdown),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: _showDropdown ? _kAccent : _kBorder),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stateSelected ? _selectedState : 'Select State',
                    style: TextStyle(
                      fontSize: 14,
                      color: stateSelected ? _kNameText : _kHint,
                    ),
                  ),
                  Row(
                    children: [
                      if (stateSelected)
                        GestureDetector(
                          onTap: _clearState,
                          child: const Icon(Icons.close, size: 16, color: _kSubText),
                        ),
                      const SizedBox(width: 4),
                      AnimatedRotation(
                        turns: _showDropdown ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(Icons.keyboard_arrow_down, size: 18, color: _kSubText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// ── STATE DROPDOWN LIST ────────────────────────────────────────────
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: _showDropdown
                ? Container(
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: _kBorder),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 8, offset: const Offset(0, 3))],
                    ),
                    child: Column(
                      children: _kStates.map((s) {
                        final isSelected = s == _selectedState;
                        return InkWell(
                          onTap: () => _selectState(s),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? _kAccent.withOpacity(0.08) : Colors.transparent,
                              border: _kStates.last != s
                                  ? const Border(bottom: BorderSide(color: _kDivider))
                                  : null,
                            ),
                            child: Text(
                              s,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                color: isSelected ? _kAccent : _kNameText,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          const SizedBox(height: 10),

          /// ── ZONE ───────────────────────────────────────────────────────────
          _sectionLabel(Icons.grid_view_rounded, 'ZONE'),
          const SizedBox(height: 5),
          _placeholderField('Not Selected', enabled: stateSelected),

          const SizedBox(height: 10),

          /// ── AREA ───────────────────────────────────────────────────────────
          _sectionLabel(Icons.location_on_outlined, 'AREA'),
          const SizedBox(height: 5),
          _placeholderField('Not Selected', enabled: false),

          const SizedBox(height: 12),

          /// ── SEARCH ─────────────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(border: Border.all(color: _kBorder), borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Icon(Icons.search, size: 18, color: _kSubText),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    style: const TextStyle(fontSize: 13),
                    decoration: const InputDecoration(
                      hintText: 'Search by ID or Name...',
                      hintStyle: TextStyle(fontSize: 13, color: _kHint),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onChanged: (v) => setState(() => _searchQuery = v),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _searchCtrl.clear();
                    setState(() => _searchQuery = '');
                  },
                  child: const Icon(Icons.refresh, size: 18, color: _kSubText),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _sectionLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 13, color: _kAccent),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: _kAccent, letterSpacing: 0.8)),
      ],
    );
  }

  Widget _placeholderField(String text, {required bool enabled}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: enabled ? Colors.white : _kDisabledBg,
        border: Border.all(color: _kBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(fontSize: 14, color: enabled ? _kSubText : _kHint)),
    );
  }
}

// ─── Customer Card ────────────────────────────────────────────────────────────

class _CustomerCard extends StatelessWidget {
  const _CustomerCard({required this.data});
  final _CustomerData data;

  void _openDetails(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 280),
      reverseTransitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (_, __, ___) => DetailsOrderActivity(
        customerName:  data.name,
        customerId:    data.id,
        customerState: data.state,
      ),
      transitionsBuilder: (_, animation, __, child) {
        final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.fastOutSlowIn));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openDetails(context),
      child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Row 1 — ID chip | Category chip | Copy icon
          Row(
            children: [
              _Chip(label: data.id, bgColor: _kIdBadge, textColor: Colors.white),
              const SizedBox(width: 8),
              _Chip(label: data.category, bgColor: _kCatBadge, textColor: _kCatText),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: data.id));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ID copied'), duration: Duration(seconds: 1)),
                  );
                },
                child: const Icon(Icons.content_copy, size: 16, color: _kSubText),
              ),
            ],
          ),
          const SizedBox(height: 6),

          /// Row 2 — Name | BDT amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(data.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: _kNameText), overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  const Icon(Icons.shopping_bag_outlined, size: 14, color: _kAccent),
                  const SizedBox(width: 3),
                  Text('BDT ${data.amount.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: _kAccent)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(height: 1, color: _kDivider),
          const SizedBox(height: 6),

          /// Row 3 — Phone | Location
          Row(
            children: [
              const Icon(Icons.phone, size: 13, color: _kAccent),
              const SizedBox(width: 4),
              Text(data.phone, style: const TextStyle(fontSize: 12, color: _kSubText)),
              const SizedBox(width: 16),
              const Icon(Icons.location_on, size: 13, color: _kAccent),
              const SizedBox(width: 4),
              Expanded(child: Text(data.location, style: const TextStyle(fontSize: 12, color: _kSubText), overflow: TextOverflow.ellipsis)),
            ],
          ),

        ],
      ),
    ));
  }
}

// ─── Chip ─────────────────────────────────────────────────────────────────────

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.bgColor, required this.textColor});
  final String label;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: textColor)),
    );
  }
}
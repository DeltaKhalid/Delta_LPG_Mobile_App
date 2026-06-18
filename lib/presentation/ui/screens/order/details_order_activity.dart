import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

// ─── Colors ───────────────────────────────────────────────────────────────────
const _kCartNavy   = Color(0xFF1A2C6B);
const _kBg         = Color(0xFFF4F5FA);
const _kIdBadge    = Color(0xFF4A5568);
const _kCatBadge   = Color(0xFFEEF0F2);
const _kCatText    = Color(0xFF4A5568);
const _kNameText   = Color(0xFF1A202C);
const _kSubText    = Color(0xFF62748E);
const _kBorder     = Color(0xFFDDE3EA);
const _kHint       = Color(0xFFADB5C2);
const _kRateLabel  = Color(0xFF9AA5B4);
const _kUnitText   = Color(0xFF62748E);

// ─── Data model ───────────────────────────────────────────────────────────────

class _ProductData {
  const _ProductData({
    required this.id,
    required this.name,
    required this.unit,
    required this.rate,
    required this.category,
  });
  final String id;
  final String name;
  final String unit;
  final double rate;
  final String category;
}

// ─── Demo products ────────────────────────────────────────────────────────────

const List<_ProductData> _kProducts = [
  _ProductData(id: '1001', name: 'PUSTI HT. DRY CAKE 70GM',     unit: 'Ctn (24.0 Pcs/Ctn)',  rate: 1.27,  category: 'BISCUITS'),
  _ProductData(id: '1002', name: 'PUSTI HT. POPS BISCUIT 25GM', unit: 'Ctn (48.0 Ctn/Ctn)',  rate: 0.32,  category: 'BISCUITS'),
  _ProductData(id: '1003', name: 'TIGER CREAM BISCUIT 90GM',    unit: 'Ctn (36.0 Pcs/Ctn)',  rate: 2.15,  category: 'BISCUITS'),
  _ProductData(id: '1004', name: 'LAYS CLASSIC CHIPS 28G',      unit: 'Ctn (50.0 Pcs/Ctn)',  rate: 0.75,  category: 'SNACKS'),
  _ProductData(id: '1005', name: 'CHEETOS CRUNCHY 30G',         unit: 'Ctn (40.0 Pcs/Ctn)',  rate: 0.90,  category: 'SNACKS'),
  _ProductData(id: '1006', name: 'KURKURE MASALA 20G',          unit: 'Ctn (60.0 Pcs/Ctn)',  rate: 0.45,  category: 'SNACKS'),
  _ProductData(id: '1007', name: 'BASMATI RICE 5KG',            unit: 'Bag (1.0 Bag/Bag)',   rate: 8.50,  category: 'RICE'),
  _ProductData(id: '1008', name: 'SELLA RICE 2KG',              unit: 'Bag (1.0 Bag/Bag)',   rate: 3.20,  category: 'RICE'),
  _ProductData(id: '1009', name: 'SUNFLOWER OIL 1LTR',         unit: 'Ctn (12.0 Btl/Ctn)',  rate: 4.10,  category: 'OIL'),
  _ProductData(id: '1010', name: 'PALM OLEIN 5LTR',             unit: 'Ctn (4.0 Btl/Ctn)',   rate: 14.75, category: 'OIL'),
  _ProductData(id: '1011', name: 'KLEENEX TISSUES 200SHT',      unit: 'Ctn (24.0 Bx/Ctn)',   rate: 1.85,  category: 'TISSUES'),
  _ProductData(id: '1012', name: 'SCOTTIES FACIAL TISSUE 100',  unit: 'Ctn (30.0 Bx/Ctn)',   rate: 1.10,  category: 'TISSUES'),
  _ProductData(id: '1013', name: 'LIPTON YELLOW LABEL 100TB',   unit: 'Ctn (24.0 Pkt/Ctn)',  rate: 3.60,  category: 'TEA & COFFEE'),
  _ProductData(id: '1014', name: 'NESCAFE CLASSIC 200G',        unit: 'Ctn (12.0 Jar/Ctn)',  rate: 11.25, category: 'TEA & COFFEE'),
];

const List<String> _kCategories = [
  'All Categories', 'BISCUITS', 'SNACKS', 'RICE', 'OIL', 'TISSUES', 'TEA & COFFEE',
];

// ─── Activity ─────────────────────────────────────────────────────────────────

class DetailsOrderActivity extends StatefulWidget {
  const DetailsOrderActivity({
    super.key,
    required this.customerName,
    required this.customerId,
    required this.customerState,
  });

  final String customerName;
  final String customerId;
  final String customerState;

  @override
  State<DetailsOrderActivity> createState() => _DetailsOrderActivityState();
}

class _DetailsOrderActivityState extends State<DetailsOrderActivity> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _searchQuery      = '';
  String _selectedCategory = 'All Categories';
  int    _cartCount        = 0;

  List<_ProductData> get _filtered {
    var list = _kProducts;
    if (_selectedCategory != 'All Categories') {
      list = list.where((p) => p.category == _selectedCategory).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list.where((p) => p.name.toLowerCase().contains(q) || p.id.contains(q)).toList();
    }
    return list;
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,

      // ── Custom white AppBar ──────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 22),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.customerName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
            ),
            Text(
              'ID: ${widget.customerId}  ·  ${widget.customerState.toUpperCase()}',
              style: const TextStyle(fontSize: 11, color: _kSubText, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: _kSubText, size: 22),
            onPressed: () {},
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: _kCartNavy, size: 22),
                onPressed: () {},
              ),
              if (_cartCount > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: Text('$_cartCount', style: const TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 4),
        ],
      ),

      // ── Body ────────────────────────────────────────────────────────────────
      body: Column(
        children: [

          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: _kBorder),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 18, color: _kHint),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      style: const TextStyle(fontSize: 13),
                      decoration: const InputDecoration(
                        hintText: 'Search products...',
                        hintStyle: TextStyle(fontSize: 13, color: _kHint),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      onChanged: (v) => setState(() => _searchQuery = v),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Category filter tabs
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _kCategories.length,
              itemBuilder: (_, i) {
                final cat      = _kCategories[i];
                final selected = cat == _selectedCategory;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = cat),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primaryButtonColor : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: selected ? AppColors.primaryButtonColor : _kBorder),
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selected ? Colors.white : _kCatText,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Blue underline under selected tab
          Container(height: 2, margin: const EdgeInsets.only(top: 6), color: _kBorder.withOpacity(0.5)),

          // Product list
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Text('No products found', style: TextStyle(color: _kSubText)))
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) => _ProductCard(
                      data: _filtered[i],
                      onAdd: () => setState(() => _cartCount++),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ─── Product Card ─────────────────────────────────────────────────────────────

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.data, required this.onAdd});
  final _ProductData data;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Row 1 — ID chip | Category chip
          Row(
            children: [
              _Chip(label: data.id,       bgColor: _kIdBadge,  textColor: Colors.white),
              const SizedBox(width: 8),
              _Chip(label: data.category, bgColor: _kCatBadge, textColor: _kCatText),
            ],
          ),
          const SizedBox(height: 8),

          // Row 2 — Product name
          Text(
            data.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: _kNameText),
          ),
          const SizedBox(height: 4),

          // Row 3 — Unit
          Row(
            children: [
              const Icon(Icons.table_rows_outlined, size: 13, color: _kUnitText),
              const SizedBox(width: 5),
              Text('Unit: ${data.unit}', style: const TextStyle(fontSize: 12, color: _kUnitText)),
            ],
          ),
          const SizedBox(height: 10),

          // Row 4 — RATE + price | +ADD button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('RATE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: _kRateLabel, letterSpacing: 0.6)),
                  const SizedBox(height: 2),
                  Text(
                    'AED ${data.rate.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _kNameText),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onAdd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryButtonColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    '+ ADD',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

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
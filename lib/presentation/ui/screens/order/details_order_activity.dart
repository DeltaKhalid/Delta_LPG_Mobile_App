import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'cart_activity.dart';

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
  // Bulk
  _ProductData(id: '1001', name: 'LPG BULK 500KG',              unit: 'Unit (1.0 Unit/Unit)', rate: 270.00,  category: 'Bulk'),
  _ProductData(id: '1002', name: 'LPG BULK 1 TON',              unit: 'Ton (1.0 Ton/Ton)',    rate: 520.00,  category: 'Bulk'),
  _ProductData(id: '1003', name: 'LPG BULK 2 TON',              unit: 'Ton (1.0 Ton/Ton)',    rate: 1000.00, category: 'Bulk'),
  _ProductData(id: '1004', name: 'LPG BULK 5 TON',              unit: 'Ton (1.0 Ton/Ton)',    rate: 2400.00, category: 'Bulk'),
  // Package
  _ProductData(id: '2001', name: 'LPG PACKAGE SMALL',           unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 35.00,   category: 'Package'),
  _ProductData(id: '2002', name: 'LPG PACKAGE MEDIUM',          unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 75.00,   category: 'Package'),
  _ProductData(id: '2003', name: 'LPG PACKAGE LARGE',           unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 140.00,  category: 'Package'),
  _ProductData(id: '2004', name: 'LPG PACKAGE PREMIUM',         unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 210.00,  category: 'Package'),
  // Refill
  _ProductData(id: '3001', name: 'LPG CYLINDER 5KG',            unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 12.00,   category: 'Refill'),
  _ProductData(id: '3002', name: 'LPG CYLINDER 12KG',           unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 25.00,   category: 'Refill'),
  _ProductData(id: '3003', name: 'LPG CYLINDER 35KG',           unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 65.00,   category: 'Refill'),
  _ProductData(id: '3004', name: 'LPG CYLINDER 45KG',           unit: 'Pcs (1.0 Pcs/Pcs)',   rate: 82.00,   category: 'Refill'),
];

const List<String> _kCategories = ['Refill', 'Package', 'Bulk'];

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
  String _selectedCategory = 'Refill';
  int    _cartCount        = 0;

  List<_ProductData> get _filtered {
    var list = _kProducts.where((p) => p.category == _selectedCategory).toList();
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
                onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 280),
                  reverseTransitionDuration: const Duration(milliseconds: 280),
                  pageBuilder: (_, __, ___) => const CartActivity(),
                  transitionsBuilder: (_, animation, __, child) {
                    final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.fastOutSlowIn));
                    return SlideTransition(position: animation.drive(tween), child: child);
                  },
                )),
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

          // Category segmented control — full width, 3 equal tabs
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFEDF0F4),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  for (int i = 0; i < _kCategories.length; i++) ...[
                  if (i > 0) const SizedBox(width: 5),
                  Expanded(child: Builder(builder: (_) {
                  final cat = _kCategories[i];
                  final selected = cat == _selectedCategory;
                  return GestureDetector(
                      onTap: () => setState(() => _selectedCategory = cat),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selected ? AppColors.primaryButtonColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: selected
                              ? [BoxShadow(color: AppColors.primaryButtonColor.withOpacity(0.28), blurRadius: 8, offset: const Offset(0, 3))]
                              : [],
                        ),
                        child: Text(
                          cat,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: selected ? Colors.white : _kSubText,
                          ),
                        ),
                      ),
                    );
                  }))],
                ],
              ),
            ),
          ),

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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // ── Left: product image ─────────────────────────────────────────────
          Container(
            width: 150,
            height: 220,
            decoration: BoxDecoration(
              color: const Color(0xFFEDF7F1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/product_demo_img.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // ── Right: all product info ─────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ID chip + Category chip
                Row(
                  children: [
                    _Chip(label: data.id,       bgColor: _kIdBadge,  textColor: Colors.white),
                    const SizedBox(width: 6),
                    _Chip(label: data.category, bgColor: _kCatBadge, textColor: _kCatText),
                  ],
                ),
                const SizedBox(height: 25),

                // Product name
                Text(
                  data.name,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: _kNameText),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),

                // Unit
                Row(
                  children: [
                    const Icon(Icons.table_rows_outlined, size: 12, color: _kUnitText),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Unit: ${data.unit}',
                        style: const TextStyle(fontSize: 11, color: _kUnitText),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // RATE + ADD button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('RATE', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: _kRateLabel, letterSpacing: 0.6)),
                        Text(
                          'AED ${data.rate.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: _kNameText),
                        ),
                      ],
                    ),

                    // GestureDetector(
                    //   onTap: onAdd,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //     decoration: BoxDecoration(
                    //       color: AppColors.primaryButtonColor,
                    //       borderRadius: BorderRadius.circular(20),
                    //       boxShadow: [BoxShadow(color: AppColors.primaryButtonColor.withOpacity(0.30), blurRadius: 6, offset: const Offset(0, 3))],
                    //     ),
                    //     child: const Text(
                    //       '+ ADD',
                    //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
                    //     ),
                    //   ),
                    // ),

                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryButtonColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: AppColors.primaryButtonColor.withValues(alpha: 0.30), blurRadius: 6, offset: const Offset(0, 3))],
                        ),
                        child: const Text(
                          '+ ADD',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
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
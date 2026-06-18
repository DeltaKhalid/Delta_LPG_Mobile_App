import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

// ─── Colors ───────────────────────────────────────────────────────────────────

const _kBg       = Color(0xFFF4F5FA);
const _kNameText = Color(0xFF1A202C);
const _kSubText  = Color(0xFF62748E);
const _kBorder   = Color(0xFFDDE3EA);

// ─── Data model ───────────────────────────────────────────────────────────────

class _CartItem {
  _CartItem({
    required this.id,
    required this.name,
    required this.category,
    required this.unitPrice,
    required this.originalPrice,
    this.quantity = 1,
  });
  final String id;
  final String name;
  final String category;
  final double unitPrice;
  final double originalPrice;
  int quantity;
}

// ─── Demo cart data ───────────────────────────────────────────────────────────

final List<_CartItem> _demoCart = [
  _CartItem(id: '3001', name: 'LPG CYLINDER 5KG',  category: 'Refill',  unitPrice: 12.00,  originalPrice: 15.00,  quantity: 3),
  _CartItem(id: '3002', name: 'LPG CYLINDER 12KG', category: 'Refill',  unitPrice: 25.00,  originalPrice: 30.00,  quantity: 2),
  _CartItem(id: '2001', name: 'LPG PACKAGE SMALL', category: 'Package', unitPrice: 35.00,  originalPrice: 42.00,  quantity: 1),
  _CartItem(id: '1001', name: 'LPG BULK 500KG',    category: 'Bulk',    unitPrice: 270.00, originalPrice: 300.00, quantity: 1),
];

// ─── Activity ─────────────────────────────────────────────────────────────────

class CartActivity extends StatefulWidget {
  const CartActivity({super.key});

  @override
  State<CartActivity> createState() => _CartActivityState();
}

class _CartActivityState extends State<CartActivity> {
  final List<_CartItem> _items = List.from(_demoCart);
  int? _selectedIndex;

  double get _subtotal => _items.fold(0.0, (s, e) => s + e.unitPrice * e.quantity);
  double get _tax      => _subtotal * 0.05;
  double get _total    => _subtotal + _tax;

  void _increment(int i) => setState(() => _items[i].quantity++);

  void _decrement(int i) {
    setState(() {
      if (_items[i].quantity > 1) _items[i].quantity--;
    });
  }

  void _remove(int i) => setState(() {
    _items.removeAt(i);
    _selectedIndex = null;
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = null),
      child: Scaffold(
        backgroundColor: _kBg,

        // ── AppBar ────────────────────────────────────────────────────────────
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.black12,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 22),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'My Cart',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black87),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black87, size: 26),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),

        // ── Body ──────────────────────────────────────────────────────────────
        body: _items.isEmpty
            ? const Center(
                child: Text('Your cart is empty', style: TextStyle(color: _kSubText, fontSize: 15)),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 14, 12, 8),
                      itemCount: _items.length,
                      itemBuilder: (_, i) => _CartItemCard(
                        item: _items[i],
                        isSelected: _selectedIndex == i,
                        onLongPress: () => setState(() => _selectedIndex = i),
                        onIncrement: () => _increment(i),
                        onDecrement: () => _decrement(i),
                        onDelete:    () => _remove(i),
                      ),
                    ),
                  ),
                  _buildSummary(),
                ],
              ),
      ),
    );
  }

  // ── Order summary + checkout ───────────────────────────────────────────────

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 16, offset: const Offset(0, -4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _summaryRow('Subtotal', 'AED ${_subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 6),
          _summaryRow('Tax (5%)', '+AED ${_tax.toStringAsFixed(2)}'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: _kBorder),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _kNameText)),
              Text(
                'AED ${_total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: _kNameText),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonColor,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              onPressed: () {},
              child: const Text(
                'Checkout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: _kSubText)),
        Text(value,  style: const TextStyle(fontSize: 13, color: _kSubText)),
      ],
    );
  }
}

// ─── Cart Item Card ───────────────────────────────────────────────────────────

class _CartItemCard extends StatelessWidget {
  const _CartItemCard({
    required this.item,
    required this.isSelected,
    required this.onLongPress,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  final _CartItem   item;
  final bool        isSelected;
  final VoidCallback onLongPress;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primaryButtonColor.withValues(alpha: 0.45) : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 2)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Product image
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF7F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/product_demo_img.png', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),

            // Name + category + price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: _kNameText),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(item.category, style: const TextStyle(fontSize: 11, color: _kSubText)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        'AED ${(item.unitPrice * item.quantity).toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primaryButtonColor),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'AED ${(item.originalPrice * item.quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: _kSubText,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: _kSubText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Delete icon (long-press reveal) + quantity controls
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelected) ...[
                  GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _QtyButton(icon: Icons.remove, onTap: onDecrement),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '${item.quantity}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: _kNameText),
                      ),
                    ),
                    _QtyButton(icon: Icons.add, onTap: onIncrement),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

// ─── Quantity Button ──────────────────────────────────────────────────────────

class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onTap});
  final IconData     icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFEDF0F4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 15, color: _kNameText),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─── Constants ────────────────────────────────────────────────────────────────

const _kAccent     = Color(0xFF0B8FAC);
const _kBg         = Color(0xFFF4F5FA);
const _kNameText   = Color(0xFF1A202C);
const _kSubText    = Color(0xFF62748E);
const _kBorder     = Color(0xFFDDE3EA);
const _kHint       = Color(0xFFADB5C2);
const _kBalance    = Color(0xFF27AE60);
const _kDueBg      = Color(0xFFFFF3E8);
const _kDueText    = Color(0xFFE07B39);
const _kUnpaid     = Color(0xFFE53E3E);
const _kSegmentBg  = Color(0xFFEDF0F4);
const _kFieldBg    = Color(0xFFF7F9FC);
const _kRequired   = Color(0xFFE53E3E);

const List<String> _kBanks = [
  'Emirates NBD',
  'First Abu Dhabi Bank',
  'Abu Dhabi Commercial Bank',
  'Mashreq Bank',
  'Dubai Islamic Bank',
  'Abu Dhabi Islamic Bank',
  'RAKBANK',
  'Commercial Bank of Dubai',
];

// ─── Invoice model ────────────────────────────────────────────────────────────

class _Invoice {
  const _Invoice({
    required this.id,
    required this.invoiceNumber,
    required this.dueDate,
    required this.total,
    required this.unpaid,
    required this.status,
  });
  final String id;
  final String invoiceNumber;
  final String dueDate;
  final double total;
  final double unpaid;
  final String status;
}

const List<_Invoice> _kInvoices = [
  _Invoice(
    id: '1',
    invoiceNumber: '#PREVICHLCUS-000005',
    dueDate: '31 Mar 2026',
    total: 5385.67,
    unpaid: 4385.67,
    status: 'DUE',
  ),
];

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _fmtCurrency(double v) {
  final str     = v.toStringAsFixed(2);
  final dot     = str.indexOf('.');
  final intPart = str.substring(0, dot);
  final decPart = str.substring(dot);
  final buf     = StringBuffer();
  for (int i = 0; i < intPart.length; i++) {
    if (i > 0 && (intPart.length - i) % 3 == 0) buf.write(',');
    buf.write(intPart[i]);
  }
  return '$buf$decPart';
}

String _fmtDateField(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

// ─── Activity ─────────────────────────────────────────────────────────────────

class CollectionDetailsActivity extends StatefulWidget {
  const CollectionDetailsActivity({
    super.key,
    required this.customerName,
    required this.customerId,
    required this.customerState,
    required this.customerBalance,
  });
  final String customerName;
  final String customerId;
  final String customerState;
  final double customerBalance;

  @override
  State<CollectionDetailsActivity> createState() => _CollectionDetailsActivityState();
}

class _CollectionDetailsActivityState extends State<CollectionDetailsActivity> {
  String   _paymentMethod    = 'Cash';
  DateTime _collectionDate   = DateTime.now();
  final TextEditingController _notesCtrl   = TextEditingController();
  final TextEditingController _branchCtrl  = TextEditingController();
  final TextEditingController _refCtrl     = TextEditingController();

  String? _selectedBank;
  bool    _showBankDropdown = false;

  final Set<String>                        _selectedIds  = {};
  final Map<String, TextEditingController> _amountCtrls  = {};

  @override
  void initState() {
    super.initState();
    for (final inv in _kInvoices) {
      _amountCtrls[inv.id] = TextEditingController();
    }
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    _branchCtrl.dispose();
    _refCtrl.dispose();
    for (final c in _amountCtrls.values) c.dispose();
    super.dispose();
  }

  // ── Computed ────────────────────────────────────────────────────────────────

  double get _totalSelected => _selectedIds.fold(0.0, (sum, id) {
    return sum + (double.tryParse(_amountCtrls[id]?.text ?? '') ?? 0.0);
  });

  // ── Actions ─────────────────────────────────────────────────────────────────

  void _toggleInvoice(_Invoice inv) {
    setState(() {
      if (_selectedIds.contains(inv.id)) {
        _selectedIds.remove(inv.id);
        _amountCtrls[inv.id]?.clear();
      } else {
        _selectedIds.add(inv.id);
        if (_amountCtrls[inv.id]!.text.isEmpty) {
          _amountCtrls[inv.id]!.text = inv.unpaid.toStringAsFixed(2);
        }
      }
    });
  }

  void _selectAll() {
    setState(() {
      for (final inv in _kInvoices) {
        _selectedIds.add(inv.id);
        if (_amountCtrls[inv.id]!.text.isEmpty) {
          _amountCtrls[inv.id]!.text = inv.unpaid.toStringAsFixed(2);
        }
      }
    });
  }

  void _setPaymentMethod(String method) =>
      setState(() { _paymentMethod = method; _showBankDropdown = false; });

  void _selectBank(String bank) =>
      setState(() { _selectedBank = bank; _showBankDropdown = false; });

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _collectionDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(primary: _kAccent),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _collectionDate = picked);
  }

  // ── Build ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final selectedCount = _selectedIds.length;
    final total         = _totalSelected;
    final hasSelection  = selectedCount > 0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (_showBankDropdown) setState(() => _showBankDropdown = false);
      },
      child: Scaffold(
        backgroundColor: _kBg,

        // ─── AppBar ──────────────────────────────────────────────────────────
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.black12,
          toolbarHeight: 72,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 22),
            onPressed: () => Navigator.pop(context),
          ),
          titleSpacing: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.customerName,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: _kNameText),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                '${widget.customerId} • ${widget.customerState}',
                style: const TextStyle(fontSize: 11, color: _kSubText),
              ),
              const SizedBox(height: 2),
              Text(
                'Balance: AED ${_fmtCurrency(widget.customerBalance)}',
                style: const TextStyle(fontSize: 11, color: _kBalance, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('INVOICES',
                      style: TextStyle(fontSize: 9, color: _kSubText, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                  Text(
                    '${_kInvoices.length}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: _kNameText),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.history, color: _kSubText, size: 22),
              onPressed: () {},
              tooltip: 'History',
            ),
          ],
        ),

        // ─── Body ────────────────────────────────────────────────────────────
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCollectionDetailsCard(),
                    const SizedBox(height: 14),
                    _buildPendingInvoicesSection(),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            _buildBottomBar(selectedCount, total, hasSelection),
          ],
        ),
      ),
    );
  }

  // ─── Collection Details Card ──────────────────────────────────────────────

  Widget _buildCollectionDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kAccent.withValues(alpha: 0.35), width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Card header ──────────────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _kAccent.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.credit_card_outlined, size: 18, color: _kAccent),
              ),
              const SizedBox(width: 10),
              const Text('Collection Details',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: _kNameText)),
            ],
          ),
          const SizedBox(height: 16),

          // ── Cash / Bank toggle ────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: _kSegmentBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _PaymentTab(
                  label: 'Cash',
                  icon: Icons.payments_outlined,
                  selected: _paymentMethod == 'Cash',
                  onTap: () => _setPaymentMethod('Cash'),
                ),
                _PaymentTab(
                  label: 'Bank',
                  icon: Icons.account_balance_outlined,
                  selected: _paymentMethod == 'Bank',
                  onTap: () => _setPaymentMethod('Bank'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // ── Collection Date ───────────────────────────────────────────────
          const _FieldLabel(text: 'COLLECTION DATE'),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: _pickDate,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              decoration: BoxDecoration(
                border: Border.all(color: _kBorder),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 15, color: _kSubText),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _fmtDateField(_collectionDate),
                      style: const TextStyle(fontSize: 14, color: _kNameText),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, size: 18, color: _kSubText),
                ],
              ),
            ),
          ),

          // ── Bank fields (animated in/out) ─────────────────────────────────
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: _paymentMethod == 'Bank'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),

                      // BANK dropdown
                      _RequiredLabel(text: 'BANK'),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () => setState(() => _showBankDropdown = !_showBankDropdown),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                          decoration: BoxDecoration(
                            border: Border.all(color: _showBankDropdown ? _kAccent : _kBorder),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.account_balance_outlined, size: 15, color: _kSubText),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  _selectedBank ?? 'Choose a Bank',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _selectedBank != null ? _kNameText : _kHint,
                                  ),
                                ),
                              ),
                              AnimatedRotation(
                                turns: _showBankDropdown ? 0.5 : 0,
                                duration: const Duration(milliseconds: 200),
                                child: const Icon(Icons.keyboard_arrow_down, size: 18, color: _kSubText),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Bank dropdown list
                      AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        child: _showBankDropdown
                            ? Container(
                                margin: const EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: _kBorder),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 8, offset: const Offset(0, 3)),
                                  ],
                                ),
                                child: Column(
                                  children: _kBanks.map((b) {
                                    final isSelected = b == _selectedBank;
                                    return InkWell(
                                      onTap: () => _selectBank(b),
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: isSelected ? _kAccent.withValues(alpha: 0.08) : Colors.transparent,
                                          border: _kBanks.last != b
                                              ? const Border(bottom: BorderSide(color: Color(0xFFEDF0F4)))
                                              : null,
                                        ),
                                        child: Text(
                                          b,
                                          style: TextStyle(
                                            fontSize: 13,
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

                      const SizedBox(height: 14),

                      // BRANCH + REF/CHQ row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _RequiredLabel(text: 'BRANCH'),
                                const SizedBox(height: 6),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: _kBorder),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller: _branchCtrl,
                                    style: const TextStyle(fontSize: 13, color: _kNameText),
                                    decoration: const InputDecoration(
                                      hintText: 'Branch',
                                      hintStyle: TextStyle(fontSize: 13, color: _kHint),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _RequiredLabel(text: 'REF/CHQ'),
                                const SizedBox(height: 6),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: _kBorder),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller: _refCtrl,
                                    style: const TextStyle(fontSize: 13, color: _kNameText),
                                    decoration: const InputDecoration(
                                      hintText: 'Reference',
                                      hintStyle: TextStyle(fontSize: 13, color: _kHint),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),

          const SizedBox(height: 14),

          // ── Notes ─────────────────────────────────────────────────────────
          const _FieldLabel(text: 'NOTES'),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: _kBorder),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: _notesCtrl,
              minLines: 3,
              maxLines: 6,
              style: const TextStyle(fontSize: 13, color: _kNameText),
              decoration: const InputDecoration(
                hintText: 'Optional remarks...',
                hintStyle: TextStyle(fontSize: 13, color: _kHint),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: InputBorder.none,
              ),
            ),
          ),

        ],
      ),
    );
  }

  // ─── Pending Invoices Section ─────────────────────────────────────────────

  Widget _buildPendingInvoicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Header row
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _kDueBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.history, size: 18, color: _kDueText),
            ),
            const SizedBox(width: 10),
            const Text(
              'PENDING INVOICES',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: _kNameText, letterSpacing: 0.5),
            ),
            const Spacer(),
            GestureDetector(
              onTap: _selectAll,
              child: const Text(
                'SELECT ALL',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: _kAccent),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Invoice cards
        for (final inv in _kInvoices)
          _InvoiceCard(
            invoice: inv,
            selected: _selectedIds.contains(inv.id),
            amountCtrl: _amountCtrls[inv.id]!,
            onToggle: () => _toggleInvoice(inv),
            onAmountChanged: () => setState(() {}),
          ),

      ],
    );
  }

  // ─── Bottom Bar ───────────────────────────────────────────────────────────

  Widget _buildBottomBar(int selectedCount, double total, bool hasSelection) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 12, offset: const Offset(0, -3)),
        ],
      ),
      child: Row(
        children: [

          // Left: count + amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$selectedCount INVOICES SELECTED',
                style: const TextStyle(fontSize: 10, color: _kSubText, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              Text(
                'AED ${_fmtCurrency(total)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: hasSelection ? _kAccent : _kNameText,
                ),
              ),
            ],
          ),
          const Spacer(),

          // Right: Confirm button
          GestureDetector(
            onTap: hasSelection ? () {
              // TODO: confirm payment
            } : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: hasSelection ? _kAccent : const Color(0xFFCBD5E0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'CONFIRM\nPAYMENT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: hasSelection ? Colors.white : _kSubText,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _paymentMethod == 'Bank' ? Icons.arrow_upward : Icons.chevron_right,
                    size: 18,
                    color: hasSelection ? Colors.white : _kSubText,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// ─── Payment Tab ─────────────────────────────────────────────────────────────

class _PaymentTab extends StatelessWidget {
  const _PaymentTab({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });
  final String   label;
  final IconData icon;
  final bool     selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            boxShadow: selected
                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 6, offset: const Offset(0, 2))]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: selected ? _kAccent : _kSubText),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: selected ? _kNameText : _kSubText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Field Label ─────────────────────────────────────────────────────────────

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: _kSubText,
        letterSpacing: 0.8,
      ),
    );
  }
}

class _RequiredLabel extends StatelessWidget {
  const _RequiredLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: _kSubText,
            letterSpacing: 0.8,
          ),
        ),
        const Text(
          ' *',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: _kRequired),
        ),
      ],
    );
  }
}

// ─── Invoice Card ─────────────────────────────────────────────────────────────

class _InvoiceCard extends StatelessWidget {
  const _InvoiceCard({
    required this.invoice,
    required this.selected,
    required this.amountCtrl,
    required this.onToggle,
    required this.onAmountChanged,
  });
  final _Invoice invoice;
  final bool     selected;
  final TextEditingController amountCtrl;
  final VoidCallback onToggle;
  final VoidCallback onAmountChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: selected
            ? Border.all(color: _kAccent.withValues(alpha: 0.40), width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [

          // ── Header row (tappable → toggle) ──────────────────────────────
          GestureDetector(
            onTap: onToggle,
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [

                // Checkbox
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? _kAccent : Colors.transparent,
                    border: Border.all(
                      color: selected ? _kAccent : const Color(0xFFCBD5E0),
                      width: 2,
                    ),
                  ),
                  child: selected
                      ? const Icon(Icons.check, size: 13, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 10),

                // Invoice number
                Expanded(
                  child: Text(
                    invoice.invoiceNumber,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: _kNameText),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 6),

                // DUE badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: _kDueBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _kDueText.withValues(alpha: 0.6), width: 0.8),
                  ),
                  child: Text(
                    invoice.status,
                    style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: _kDueText),
                  ),
                ),
                const SizedBox(width: 8),

                // Due date
                Text(
                  invoice.dueDate,
                  style: const TextStyle(fontSize: 11, color: _kSubText),
                ),

              ],
            ),
          ),
          const SizedBox(height: 10),

          // ── TOTAL + UNPAID boxes ─────────────────────────────────────────
          Row(
            children: [
              const SizedBox(width: 32),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: _kFieldBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('TOTAL',
                          style: TextStyle(fontSize: 9, color: _kSubText, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                      const SizedBox(height: 3),
                      Text(
                        _fmtCurrency(invoice.total),
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _kNameText),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: _kUnpaid.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('UNPAID',
                          style: TextStyle(fontSize: 9, color: _kUnpaid, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                      const SizedBox(height: 3),
                      Text(
                        _fmtCurrency(invoice.unpaid),
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _kUnpaid),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Amount input (only when selected) ────────────────────────────
          if (selected) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: _kAccent, width: 1.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'AED',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _kSubText),
                  ),
                  const SizedBox(width: 10),
                  Container(width: 1, height: 18, color: const Color(0xFFDDE3EA)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: amountCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                      ],
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _kNameText),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      onChanged: (_) => onAmountChanged(),
                    ),
                  ),
                ],
              ),
            ),
          ],

        ],
      ),
    );
  }
}
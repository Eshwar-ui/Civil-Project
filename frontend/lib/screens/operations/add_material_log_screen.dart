import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class AddMaterialLogScreen extends StatefulWidget {
  const AddMaterialLogScreen({super.key});

  @override
  State<AddMaterialLogScreen> createState() => _AddMaterialLogScreenState();
}

class _AddMaterialLogScreenState extends State<AddMaterialLogScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _materialNameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _vendorController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _billAmountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String? _selectedUnit = 'Bags';
  String? _paymentType = 'Credit';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Text(
                'Log Material',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C1E),
                ),
              ),
              const SizedBox(height: 24),

              CustomTextField(
                labelText: 'Date of Entry',
                hintText: 'DD/MM/YYYY',
                controller: _dateController,
                prefixIcon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                labelText: 'Material Name',
                hintText: 'e.g. Steel, Cement',
                controller: _materialNameController,
                prefixIcon: Icons.inventory_2_outlined,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                labelText: 'Grade / Type',
                hintText: 'e.g. 53 Grade, TMT 12mm',
                controller: _gradeController,
                prefixIcon: Icons.format_list_bulleted,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      labelText: 'Quantity',
                      hintText: '0',
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: _buildDropdown(
                      'Unit',
                      ['Bags', 'Tons', 'Units', 'Meters'],
                      (val) => setState(() => _selectedUnit = val),
                      _selectedUnit,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              CustomTextField(
                labelText: 'Vendor / Supplier',
                hintText: 'Select or enter supplier name',
                controller: _vendorController,
                prefixIcon: Icons.business_outlined,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      labelText: 'Bill Amount',
                      hintText: '₹ 0.00',
                      controller: _billAmountController,
                      prefixIcon: Icons.payments_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: CustomTextField(
                      labelText: 'Rate/Unit',
                      hintText: '₹ 0',
                      controller: _rateController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildDropdown(
                'Payment Type',
                ['Credit', 'Cash', 'UPI'],
                (val) => setState(() => _paymentType = val),
                _paymentType,
              ),

              const SizedBox(height: 40),
              CustomButton(
                text: 'Save Material Entry',
                onPressed: () => context.pop(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    Function(String?) onChanged,
    String? value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF74777F),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: items
                  .map(
                    (u) => DropdownMenuItem(
                      value: u,
                      child: Text(u, style: const TextStyle(fontSize: 13)),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

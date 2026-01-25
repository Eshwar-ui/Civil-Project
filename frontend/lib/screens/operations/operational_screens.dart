import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  String _selectedView = 'Received'; // 'Received' or 'Consumption'
  final TextEditingController _materialNameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _vendorController = TextEditingController();
  final TextEditingController _billAmountController = TextEditingController();

  @override
  void dispose() {
    _materialNameController.dispose();
    _gradeController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    _vendorController.dispose();
    _billAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-navigation buttons
          Row(
            children: [
              Expanded(
                child: _buildViewButton(
                  'Received',
                  _selectedView == 'Received',
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildViewButton(
                  'Consumption',
                  _selectedView == 'Consumption',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Log Materials Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Log Materials',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.65,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Add data to the site ledger',
                style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
              ),
              const SizedBox(height: 20),

              // Form Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.mediumRadius,
                  border: Border.all(color: AppColors.border, width: 1.18),
                  boxShadow: AppColors.cardShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Material name dropdown
                    _buildDropdownField(
                      label: 'Material name',
                      hint: '-- Select Material --',
                    ),
                    const SizedBox(height: 16),

                    // Grade / type
                    FormTextField(
                      label: 'Grade / type',
                      controller: _gradeController,
                      hintText: 'Cement, Iron, etc.',
                    ),
                    const SizedBox(height: 16),

                    // Quantity & Unit (side by side)
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: FormTextField(
                            label: 'Quantity',
                            controller: _quantityController,
                            hintText: '50',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FormTextField(
                            label: 'Unit',
                            controller: _unitController,
                            hintText: 'pkts',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Vendor / supplier
                    FormTextField(
                      label: 'Vendor / supplier',
                      controller: _vendorController,
                      hintText: 'Enter vendor name',
                    ),
                    const SizedBox(height: 16),

                    // Payment Type dropdown
                    _buildDropdownField(
                      label: 'Payment Type',
                      hint: '-- Select Payment Type --',
                    ),
                    const SizedBox(height: 16),

                    // Bill amount
                    FormTextField(
                      label: 'Bill amount',
                      controller: _billAmountController,
                      hintText: '₹',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),

                    // Save Material Entry button
                    PrimaryButton(
                      text: 'Save Material Entry',
                      onPressed: () {
                        // TODO: Save material entry
                      },
                    ),
                    const SizedBox(height: 12),

                    // Add New Material button (outlined)
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppRadius.mediumRadius,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // TODO: Add new material
                          },
                          borderRadius: AppRadius.mediumRadius,
                          child: Center(
                            child: Text(
                              'Add New Material',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Materials History Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Materials History',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '3 verified logs',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              Container(
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.largeRadius,
                  border: Border.all(
                    color: AppColors.borderMedium,
                    width: 1.18,
                  ),
                  boxShadow: AppColors.cardShadow,
                ),
                child: Center(
                  child: Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Material History Cards
          _buildMaterialHistoryCard(
            materialName: 'UltraTech Cement',
            grade: 'GRADE 53',
            supplier: 'Bharat Steels',
            quantity: '500',
            unit: 'PKTS',
            date: 'Oct 24',
          ),
          const SizedBox(height: 16),
          _buildMaterialHistoryCard(
            materialName: 'TMT Iron Rods',
            grade: 'FE 500D',
            supplier: 'Jindal Panther',
            quantity: '1200',
            unit: 'KG',
            date: 'Oct 23',
          ),
          const SizedBox(height: 16),
          _buildMaterialHistoryCard(
            materialName: 'Asian Paints White',
            grade: 'Apex Dust Proof',
            supplier: 'Hardware Hub',
            quantity: '40',
            unit: '',
            date: 'Oct 22',
          ),

          // Bottom padding
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildViewButton(String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedView = label;
        });
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.surface,
          borderRadius: AppRadius.mediumRadius,
          border: Border.all(
            color: isActive ? AppColors.primary : AppColors.border,
            width: 1.18,
          ),
          boxShadow: isActive ? null : AppColors.cardShadow,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.textOnPrimary : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 47,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMedium, width: 1.35),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hint,
                  style: TextStyle(fontSize: 15, color: AppColors.textTertiary),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 24,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialHistoryCard({
    required String materialName,
    required String grade,
    required String supplier,
    required String quantity,
    required String unit,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 1),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border, width: 1.18),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        materialName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        grade,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$quantity ${unit.isNotEmpty ? unit.toUpperCase() : ''}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.borderDark,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  supplier,
                  style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MachineryScreen extends StatelessWidget {
  const MachineryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE0E0E0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.build, color: Colors.orange),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CAT Excavator 320D',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Serial: #CAT-56901',
                      style: TextStyle(color: Color(0xFF74777F), fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'At Work',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LaborScreen extends StatelessWidget {
  const LaborScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: StatusStatCard(
                  title: 'Total Labor',
                  value: '142',
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: StatusStatCard(
                  title: 'At Work',
                  value: '128',
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const SectionHeader(title: 'Workforce Assignments'),
          const SizedBox(height: 16),
          for (var i = 0; i < 6; i++) _buildLaborListItem(i),
        ],
      ),
    );
  }

  Widget _buildLaborListItem(int i) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF1E6BE6).withOpacity(0.1),
          child: const Icon(Icons.person, color: Color(0xFF1E6BE6), size: 20),
        ),
        title: Text(
          'Team Lead Group ${i + 1}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          'Site ${String.fromCharCode(65 + i)} - ${15 + i} workers',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 20,
          color: Color(0xFFE0E0E0),
        ),
      ),
    );
  }
}

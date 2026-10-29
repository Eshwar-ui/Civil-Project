import 'package:flutter/material.dart';
import '../../widgets/enterprise_components.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  String? _selectedManager;

  final List<String> _managers = [
    'James Wilson',
    'Sarah Parker',
    'Robert Chen',
    'Anita Desai',
  ];

  void _onSaveProject() {
    if (_formKey.currentState!.validate()) {
      debugPrint('Saving project: ${_nameController.text}');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleIconButton(
                      icon: Icons.arrow_back,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Add New Project',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1C1E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  labelText: 'Project Name',
                  hintText: 'e.g. Skyline Towers P2',
                  controller: _nameController,
                  prefixIcon: Icons.business,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Client Name',
                  hintText: 'e.g. Skyline Developers',
                  controller: _clientController,
                  prefixIcon: Icons.person_outline,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Start Date',
                        hintText: 'DD/MM/YYYY',
                        controller: _dateController,
                        prefixIcon: Icons.calendar_today,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        labelText: 'Total Budget',
                        hintText: '\$ 0.00',
                        controller: _budgetController,
                        prefixIcon: Icons.payments_outlined,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Site Location',
                  hintText: 'Enter full address',
                  controller: _locationController,
                  prefixIcon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Assign Site Manager',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF74777F),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedManager,
                      hint: const Text('Select a manager'),
                      isExpanded: true,
                      items: _managers
                          .map(
                            (m) => DropdownMenuItem(value: m, child: Text(m)),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _selectedManager = val),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                CustomButton(text: 'Create Project', onPressed: _onSaveProject),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class AddStaffScreen extends StatefulWidget {
  const AddStaffScreen({super.key});

  @override
  State<AddStaffScreen> createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  // Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _onSave() {
    debugPrint('Saving manager...');
    // TODO: Implement save logic
    context.pop();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _positionController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ModernAppBar(title: 'Add manager', onBack: () => context.pop()),
      body: Column(
        children: [
          // Form Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // First Name
                  FormTextField(
                    label: 'First Name',
                    controller: _firstNameController,
                  ),
                  const SizedBox(height: 10),
                  // Last Name
                  FormTextField(
                    label: 'Last Name',
                    controller: _lastNameController,
                  ),
                  const SizedBox(height: 10),
                  // Position
                  FormTextField(
                    label: 'Position',
                    controller: _positionController,
                  ),
                  const SizedBox(height: 10),
                  // Email
                  FormTextField(
                    label: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  // Phone
                  FormTextField(
                    label: 'Phone',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  // Address
                  FormTextField(
                    label: 'Address',
                    controller: _addressController,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),

          // Save Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            decoration: BoxDecoration(
              color: AppColors.background,
              border: const Border(
                top: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: PrimaryButton(onPressed: _onSave, text: 'Save'),
          ),
        ],
      ),
    );
  }
}

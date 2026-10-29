import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class EditManagerDetailsScreen extends StatefulWidget {
  final String managerId;
  final String? initialFirstName;
  final String? initialLastName;
  final String? initialPosition;
  final String? initialEmail;
  final String? initialPhone;
  final String? initialAddress;

  const EditManagerDetailsScreen({
    super.key,
    required this.managerId,
    this.initialFirstName,
    this.initialLastName,
    this.initialPosition,
    this.initialEmail,
    this.initialPhone,
    this.initialAddress,
  });

  @override
  State<EditManagerDetailsScreen> createState() =>
      _EditManagerDetailsScreenState();
}

class _EditManagerDetailsScreenState extends State<EditManagerDetailsScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _positionController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.initialFirstName ?? 'Ramesh',
    );
    _lastNameController = TextEditingController(
      text: widget.initialLastName ?? 'Kumar',
    );
    _positionController = TextEditingController(
      text: widget.initialPosition ?? 'Head Manager',
    );
    _emailController = TextEditingController(
      text: widget.initialEmail ?? 'rameshkumar@manager.com',
    );
    _phoneController = TextEditingController(
      text: widget.initialPhone ?? '+91 9874563210',
    );
    _addressController = TextEditingController(
      text:
          widget.initialAddress ??
          '4517 Washington Ave. Manchester, Kentucky 39495',
    );
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

  void _onUpdate() {
    debugPrint('Updating manager details...');
    // TODO: Implement update logic
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ModernAppBar(title: 'Edit Details', onBack: () => context.pop()),
      body: SafeArea(
        child: Column(
          children: [
            // Form Content
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
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

            // Update Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                border: const Border(
                  top: BorderSide(color: AppColors.border, width: 1),
                ),
              ),
              child: PrimaryButton(
                onPressed: _onUpdate,
                text: 'Update Details',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

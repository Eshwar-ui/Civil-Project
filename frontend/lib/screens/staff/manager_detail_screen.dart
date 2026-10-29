import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class ManagerDetailScreen extends StatelessWidget {
  final String managerId;
  final String name;
  final String role;
  final String initials;

  const ManagerDetailScreen({
    super.key,
    required this.managerId,
    required this.name,
    required this.role,
    required this.initials,
  });

  void _onEdit(BuildContext context) {
    // Parse name into first and last name
    final nameParts = name.split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts[0] : '';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    context.pushNamed(
      'edit-manager',
      pathParameters: {'id': managerId},
      queryParameters: {
        'firstName': firstName,
        'lastName': lastName,
        'position': role,
        'email': 'rameshkumar@manager.com',
        'phone': '+91 9874563210',
        'address': '4517 Washington Ave. Manchester, Kentucky 39495',
      },
    );
  }

  void _onCopyEmail(String email) {
    debugPrint('Copy email: $email');
    // TODO: Implement clipboard copy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ModernAppBar(
        title: 'Manager Details',
        onBack: () => context.pop(),
        action: appBarActionButton(
          icon: Icons.edit_outlined,
          onPressed: () => _onEdit(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Manager Profile Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.largeRadius,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar and Name Section
                    Row(
                      children: [
                        // Avatar
                        Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: AppRadius.largeRadius,
                          ),
                          child: Center(
                            child: Text(
                              initials,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Name and Role
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                role,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Contact Information
                    _buildInfoRow(
                      label: 'email',
                      value: 'rameshkumar@manager.com',
                      showCopy: true,
                      onCopy: () => _onCopyEmail('rameshkumar@manager.com'),
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(label: 'Phone', value: '+91 9874563210'),
                    const SizedBox(height: 12),
                    _buildInfoRow(label: 'Join Date', value: '10/28/12'),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      label: 'address',
                      value: '4517 Washington Ave. Manchester, Kentucky 39495',
                      isMultiline: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Assigned Projects Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.largeRadius,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Assigned Projects:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildProjectList(),
                  ],
                ),
              ),

              // Bottom padding
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
    bool showCopy = false,
    VoidCallback? onCopy,
    bool isMultiline = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                maxLines: isMultiline ? 2 : 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showCopy)
              GestureDetector(
                onTap: onCopy,
                child: const Icon(
                  Icons.copy_all,
                  size: 24,
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectList() {
    final projects = ['HYD-1', 'HYD-2', 'HYD-3'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: projects.asMap().entries.map((entry) {
        final index = entry.key;
        final project = entry.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            '${index + 1}.$project',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        );
      }).toList(),
    );
  }
}

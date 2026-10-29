import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final String projectId;
  const ProjectDetailsScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ModernAppBar.projectHeader(
        title: 'Skyline Towers',
        onBack: () => context.pop(),
        action: appBarActionButton(
          icon: Icons.edit_outlined,
          onPressed: () {
            // TODO: Navigate to edit project
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Assigned Engineer Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.xxlRadius,
                  border: Border.all(color: AppColors.border, width: 1.18),
                  boxShadow: AppColors.cardShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Assigned Engineer Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ASSIGNED ENGINEER',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textTertiary,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Rama Roa',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: AppRadius.largeRadius,
                            border: Border.all(
                              color: AppColors.border,
                              width: 1.18,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 24,
                              color: AppColors.textSecondary,
                            ),
                            onPressed: () {
                              // TODO: Edit engineer
                            },
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Phase 2 Work Section
                    Row(
                      children: [
                        Text(
                          'PHASE 2 WORK',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textTertiary,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.calendar_today,
                          size: 15,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Completion by Dec 2024',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.borderDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Material Tracking - Steel
                    _buildMaterialCard(
                      icon: Icons.construction,
                      materialName: 'Steel',
                      remaining: '50 Tons left',
                      received: '150 Tons',
                      consumed: '100 Tons',
                      progress: 0.67, // 100/150
                    ),
                    const SizedBox(height: 10.5),

                    // Material Tracking - Cement
                    _buildMaterialCard(
                      icon: Icons.inventory_2,
                      materialName: 'Cement',
                      remaining: '50 Bags left',
                      received: '150 Bags',
                      consumed: '100 Bags',
                      progress: 0.67, // 100/150
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Navigation Cards
              _buildNavCard(
                context,
                icon: Icons.architecture_outlined,
                title: 'Blueprints',
                subtitle: 'project documents / drawings',
                onTap: () => context.pushNamed('blueprints'),
              ),
              const SizedBox(height: 12),
              _buildNavCard(
                context,
                icon: Icons.assignment_outlined,
                title: 'Operations',
                subtitle: 'consumption and Expenses',
                onTap: () => context.pushNamed('operational-expenses'),
              ),
              const SizedBox(height: 12),
              _buildNavCard(
                context,
                icon: Icons.assessment_outlined,
                title: 'Reports / Insights',
                subtitle: 'bills and reports',
                onTap: () {
                  // TODO: Navigate to reports
                },
              ),

              const SizedBox(height: 16),

              // Delete Project Button
              GestureDetector(
                onTap: () {
                  // TODO: Show delete confirmation
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete_outline,
                        size: 32,
                        color: AppColors.error,
                      ),
                      const SizedBox(width: 21),
                      Text(
                        'Delete Project',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
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

  Widget _buildMaterialCard({
    required IconData icon,
    required String materialName,
    required String remaining,
    required String received,
    required String consumed,
    required double progress,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6.64),
              ),
              child: Icon(icon, size: 24, color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    materialName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    remaining,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.borderDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.5),
        // Progress bar
        Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(55.34),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(55.34),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.5),
        // Received and Consumed
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'received',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.borderDark.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  received,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'consumed',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.borderDark.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  consumed,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 98,
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 1),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.border, width: 1.18),
          boxShadow: AppColors.cardShadow,
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.infoTint,
                borderRadius: AppRadius.largeRadius,
              ),
              child: Icon(icon, size: 28, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: AppRadius.mediumRadius,
                border: Border.all(color: AppColors.border, width: 1.18),
              ),
              child: const Icon(
                Icons.chevron_right,
                size: 18,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

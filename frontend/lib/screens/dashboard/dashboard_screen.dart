import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _refreshDashboard() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  void _onNotificationPressed() {
    debugPrint('Opening notifications...');
  }

  void _onProfilePressed() {
    context.go('/profile');
  }

  void _onViewAllProjects() {
    context.go('/projects');
  }

  void _onProjectSelected(String projectId) {
    context.pushNamed('project-details', pathParameters: {'id': projectId});
  }

  void _navigateToOperation(String type) {
    context.pushNamed(type.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshDashboard,
          color: AppColors.primary,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderSection(),
                _buildOperationsSection(),
                _buildActiveProjectsSection(),
                _buildRecentOperationsSection(),
                // Extra padding for bottom nav bar
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============ HEADER SECTION ============
  Widget _buildHeaderSection() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1.18),
        ),
      ),
      padding: AppSpacing.screenPaddingAll.copyWith(bottom: 20),
      child: Column(
        children: [
          // Top row: Welcome + Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome back,', style: AppTypography.bodySecondary),
                  const SizedBox(height: 2),
                  Text('Admin', style: AppTypography.heading1),
                ],
              ),
              Row(
                children: [
                  CircleIconButton(
                    icon: Icons.notifications_outlined,
                    onPressed: _onNotificationPressed,
                    showBadge: true,
                    badgeColor: AppColors.error,
                  ),
                  const SizedBox(width: 12),
                  ProfileAvatar(
                    onTap: _onProfilePressed,
                    borderColor: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Stat cards
          Row(
            children: [
              Expanded(
                child: PrimaryStatCard(
                  title: 'Active Projects',
                  value: '08',
                  badge: '+12%',
                  icon: Icons.show_chart,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SecondaryStatCard(
                  title: 'Total Workers',
                  value: '142',
                  icon: Icons.people_outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============ OPERATIONS SECTION ============
  Widget _buildOperationsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Operations', style: AppTypography.heading2),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OperationCard(
                  title: 'Materials',
                  subtitle: '5 Vendors',
                  icon: Icons.inventory_2_outlined,
                  iconBackgroundColor: AppColors.primaryTint,
                  iconColor: AppColors.primary,
                  onTap: () => _navigateToOperation('Materials'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OperationCard(
                  title: 'Machinery',
                  subtitle: '12 Units',
                  icon: Icons.build_outlined,
                  iconBackgroundColor: AppColors.warningTint,
                  iconColor: AppColors.warningLight,
                  onTap: () => _navigateToOperation('Machinery'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OperationCard(
                  title: 'Labor',
                  subtitle: '142 Workers',
                  icon: Icons.engineering_outlined,
                  iconBackgroundColor: AppColors.successTint,
                  iconColor: AppColors.successLight,
                  onTap: () => _navigateToOperation('Labor'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============ ACTIVE PROJECTS SECTION ============
  Widget _buildActiveProjectsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: Column(
        children: [
          SectionHeader(
            title: 'Active Projects',
            actionLabel: 'View All',
            onAction: _onViewAllProjects,
          ),
          const SizedBox(height: 16),
          ProjectCard(
            type: 'Commercial',
            title: 'Skyline Towers P2',
            progress: 0.65,
            progressColor: AppColors.primary,
            status: 'Active',
            onTap: () => _onProjectSelected('skyline-towers-p2'),
          ),
          const SizedBox(height: 16),
          ProjectCard(
            type: 'Residential',
            title: 'Green Valley Villas',
            progress: 0.32,
            progressColor: AppColors.success,
            status: 'Active',
            onTap: () => _onProjectSelected('green-valley-villas'),
          ),
          const SizedBox(height: 16),
          ProjectCard(
            type: 'Infrastructure',
            title: 'Metro Line Ext.',
            progress: 0.88,
            progressColor: AppColors.warning,
            status: 'Active',
            onTap: () => _onProjectSelected('metro-line-ext'),
          ),
        ],
      ),
    );
  }

  // ============ RECENT OPERATIONS SECTION ============
  Widget _buildRecentOperationsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Operations', style: AppTypography.heading2),
          const SizedBox(height: 16),
          ListContainer(
            children: [
              ActivityItem(
                emoji: '📦',
                backgroundColor: AppColors.infoTint,
                title: 'Material Received',
                subtitle: '500 bags of cement delivered to Skyline',
                time: '10 mins ago',
                showBorder: true,
              ),
              ActivityItem(
                emoji: '⚠️',
                backgroundColor: AppColors.errorTint,
                title: 'Labor Shortage',
                subtitle: 'Unskilled workers count below threshold',
                time: '1 hr ago',
                showBorder: true,
              ),
              ActivityItem(
                emoji: '📄',
                backgroundColor: AppColors.warningTintAlt,
                title: 'New Drawing',
                subtitle: 'Admin uploaded Block C floor plan',
                time: '3 hrs ago',
                showBorder: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

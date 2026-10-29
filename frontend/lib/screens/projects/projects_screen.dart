import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Active', 'Completed', 'Upcoming'];

  void _onProjectTap(String projectId) {
    context.pushNamed('project-details', pathParameters: {'id': projectId});
  }

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section with white background
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  bottom: BorderSide(color: AppColors.border, width: 1.18),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text('Projects', style: AppTypography.heading1),
                  const SizedBox(height: 24),

                  // Search bar with filter button
                  Row(
                    children: [
                      // Search field
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: AppRadius.mediumRadius,
                            border: Border.all(
                              color: AppColors.border,
                              width: 1.18,
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.search,
                                color: AppColors.textSecondary,
                                size: 18,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  style: AppTypography.body,
                                  decoration: InputDecoration(
                                    hintText: 'Search projects...',
                                    hintStyle: AppTypography.bodySecondary,
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  onChanged: (_) => setState(() {}),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Filter button
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceVariant,
                          borderRadius: AppRadius.mediumRadius,
                          border: Border.all(
                            color: AppColors.border,
                            width: 1.18,
                          ),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _filters.map((filter) {
                        final isSelected = _selectedFilter == filter;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => _onFilterChanged(filter),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.surface,
                                borderRadius: AppRadius.fullRadius,
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.border,
                                  width: 1.18,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: AppColors.primary.withOpacity(
                                            0.2,
                                          ),
                                          blurRadius: 6,
                                          offset: const Offset(0, 4),
                                        ),
                                        BoxShadow(
                                          color: AppColors.primary.withOpacity(
                                            0.15,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Text(
                                filter,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? AppColors.textOnPrimary
                                      : AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Project List
            Expanded(child: _buildProjectList()),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectList() {
    // Sample data matching Figma
    final projects = [
      {
        'title': 'Skyline Towers Phase 2',
        'type': 'RESIDENTIAL',
        'location': 'Mumbai, MH',
        'progress': 0.65,
        'isCompleted': false,
      },
      {
        'title': 'Green Valley Villas',
        'type': 'RESIDENTIAL',
        'location': 'Pune, MH',
        'progress': 0.32,
        'isCompleted': false,
      },
      {
        'title': 'Metro Line Ext.',
        'type': 'INFRASTRUCTURE',
        'location': 'Delhi, NCR',
        'progress': 1.0,
        'isCompleted': true,
      },
      {
        'title': 'NH-48 Bridge',
        'type': 'INFRASTRUCTURE',
        'location': 'Gurugram, HR',
        'progress': 0.0,
        'isCompleted': false,
      },
      {
        'title': 'Industrial Hub X',
        'type': 'COMMERCIAL',
        'location': 'Bengaluru, KA',
        'progress': 0.82,
        'isCompleted': false,
      },
    ];

    // Filter logic
    final query = _searchController.text.toLowerCase();
    final filteredProjects = projects.where((project) {
      final matchesQuery =
          project['title'].toString().toLowerCase().contains(query) ||
          project['type'].toString().toLowerCase().contains(query) ||
          project['location'].toString().toLowerCase().contains(query);

      final isCompleted = project['isCompleted'] as bool;
      final progress = project['progress'] as double;

      bool matchesFilter = true;
      switch (_selectedFilter) {
        case 'Active':
          matchesFilter = !isCompleted && progress > 0;
          break;
        case 'Completed':
          matchesFilter = isCompleted;
          break;
        case 'Upcoming':
          matchesFilter = progress == 0 && !isCompleted;
          break;
      }

      return matchesQuery && matchesFilter;
    }).toList();

    if (filteredProjects.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.architecture_outlined,
        title: 'No Projects Found',
        description: _searchController.text.isEmpty
            ? 'You haven\'t added any projects yet. Start by creating your first construction project.'
            : 'We couldn\'t find any projects matching "${_searchController.text}".',
        actionLabel: _searchController.text.isEmpty
            ? 'Add Project'
            : 'Clear Search',
        onAction: () {
          if (_searchController.text.isNotEmpty) {
            setState(() => _searchController.clear());
          } else {
            context.pushNamed('add-project');
          }
        },
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
      itemCount: filteredProjects.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final project = filteredProjects[index];
        return ProjectListCard(
          title: project['title'] as String,
          type: project['type'] as String,
          location: project['location'] as String,
          progress: project['progress'] as double,
          isCompleted: project['isCompleted'] as bool,
          onTap: () => _onProjectTap(project['title'] as String),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

/// Project list card matching Figma design
class ProjectListCard extends StatelessWidget {
  final String title;
  final String type;
  final String location;
  final double progress;
  final bool isCompleted;
  final VoidCallback? onTap;

  const ProjectListCard({
    super.key,
    required this.title,
    required this.type,
    required this.location,
    required this.progress,
    this.isCompleted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progressColor = isCompleted ? AppColors.success : AppColors.primary;
    final buttonBackgroundColor = isCompleted
        ? AppColors.successButtonTint
        : AppColors.primaryTint;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(21),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.xlRadius,
          border: Border.all(color: AppColors.border, width: 1.18),
          boxShadow: AppColors.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: Type, Location, More button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Type and Location row
                      Row(
                        children: [
                          Text(
                            type,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              letterSpacing: 0.55,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '•',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.borderMedium,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.location_on_outlined,
                            size: 10,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Title
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                // More options button
                GestureDetector(
                  onTap: () {
                    // Show more options
                  },
                  child: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Progress row
            Row(
              children: [
                // Progress bar and labels
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress bar
                      ClipRRect(
                        borderRadius: AppRadius.fullRadius,
                        child: LinearProgressIndicator(
                          value: progress.clamp(0.0, 1.0),
                          backgroundColor: AppColors.border,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            progressColor,
                          ),
                          minHeight: 6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Labels
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Completion',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Arrow button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: buttonBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: progressColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

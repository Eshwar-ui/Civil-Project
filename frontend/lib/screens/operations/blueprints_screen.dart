import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../widgets/enterprise_components.dart';

class BlueprintsScreen extends StatefulWidget {
  const BlueprintsScreen({super.key});

  @override
  State<BlueprintsScreen> createState() => _BlueprintsScreenState();
}

class _BlueprintsScreenState extends State<BlueprintsScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _showCreateFolderSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreateFolderBottomSheet(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ModernAppBar.projectHeader(
        title: 'Project Management',
        titleFontSize: 18,
        onBack: () => context.pop(),
        action: appBarActionButton(
          icon: Icons.edit_outlined,
          onPressed: () {
            // TODO: Edit
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumb
              Row(
                children: [
                  Text(
                    'skyline Towers /',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Blueprint /',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search and Filter
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppRadius.xlRadius,
                        border: Border.all(
                          color: AppColors.border,
                          width: 1.18,
                        ),
                        boxShadow: AppColors.cardShadow,
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search drawings...',
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            color: AppColors.textSecondary,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 18,
                            color: AppColors.textSecondary,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: AppRadius.xlRadius,
                      border: Border.all(color: AppColors.border, width: 1.18),
                      boxShadow: AppColors.cardShadow,
                    ),
                    child: const Icon(
                      Icons.tune,
                      size: 20,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Blueprints Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Blueprints',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.475,
                    ),
                  ),
                  GestureDetector(
                    onTap: _showCreateFolderSheet,
                    child: Text(
                      'Create Folders',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Admin Category
              _buildCategoryDivider('admin'),
              const SizedBox(height: 16),
              _buildBlueprintCard(
                icon: Icons.description_outlined,
                iconColor: AppColors.primary,
                iconBackground: AppColors.infoTint,
                title: 'Main Architectural Plan',
                version: 'v2.4',
                author: 'Admin',
                size: '4.8 MB',
              ),
              const SizedBox(height: 24),

              // General Category
              _buildCategoryDivider('General'),
              const SizedBox(height: 16),
              _buildBlueprintCard(
                icon: Icons.description_outlined,
                iconColor: AppColors.warning,
                iconBackground: AppColors.warningTintAlt,
                title: 'Structural Beam Layout',
                version: 'v1.1',
                author: 'Structural Eng.',
                size: '12.2 MB',
              ),
              const SizedBox(height: 16),
              _buildBlueprintCard(
                icon: Icons.description_outlined,
                iconColor: AppColors.primary,
                iconBackground: AppColors.infoTint,
                title: 'Electrical Conduit Path',
                version: 'v3.0',
                author: 'Site Head',
                size: '2.5 MB',
              ),
              const SizedBox(height: 16),
              _buildBlueprintCard(
                icon: Icons.description_outlined,
                iconColor: AppColors.primary,
                iconBackground: AppColors.infoTint,
                title: 'Plumbing Isometric',
                version: 'v1.2',
                author: 'Admin',
                size: '3.1 MB',
              ),

              // Bottom padding
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDivider(String category) {
    return Row(
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFFAAADAF),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Container(height: 1, color: AppColors.borderDark)),
      ],
    );
  }

  Widget _buildBlueprintCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String version,
    required String author,
    required String size,
  }) {
    return Container(
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
              color: iconBackground,
              borderRadius: AppRadius.largeRadius,
            ),
            child: Icon(icon, size: 28, color: iconColor),
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '$version • $author',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.borderDark,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      size.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
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
              Icons.visibility_outlined,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Create Folder Bottom Sheet
class CreateFolderBottomSheet extends StatefulWidget {
  const CreateFolderBottomSheet({super.key});

  @override
  State<CreateFolderBottomSheet> createState() =>
      _CreateFolderBottomSheetState();
}

class _CreateFolderBottomSheetState extends State<CreateFolderBottomSheet> {
  final TextEditingController _folderNameController = TextEditingController();

  @override
  void dispose() {
    _folderNameController.dispose();
    super.dispose();
  }

  void _onCreate() {
    if (_folderNameController.text.trim().isNotEmpty) {
      // TODO: Create folder logic
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isVisible = false;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 10,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.borderMedium,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

            // Content Card
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                boxShadow: AppColors.cardShadow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with icon, title, subtitle, and toggle
                    Row(
                      children: [
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
                            Icons.add,
                            size: 24,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Upload Blueprint files',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Make this file visible to everyone',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Toggle Switch
                        StatefulBuilder(
                          builder: (context, setLocalState) {
                            return Switch(
                              value: isVisible,
                              onChanged: (value) {
                                setLocalState(() {
                                  isVisible = value;
                                });
                                setState(() {
                                  isVisible = value;
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Doc Name Input
                    FormTextField(
                      label: 'Doc Name',
                      controller: _folderNameController,
                      hintText: '',
                    ),
                    const SizedBox(height: 8),

                    // Upload Date Input
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Upload Date',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: AppRadius.mediumRadius,
                            border: Border.all(
                              color: AppColors.border,
                              width: 1.18,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '13-01-2026',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Upload documentation button
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppRadius.largeRadius,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.25,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // TODO: Upload documentation
                          },
                          borderRadius: AppRadius.largeRadius,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.upload_file,
                                  size: 24,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Upload documentation',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Save Button
                    PrimaryButton(text: 'Save', onPressed: _onCreate),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

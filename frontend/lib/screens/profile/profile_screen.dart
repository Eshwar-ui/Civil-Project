import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _onEditProfile() {
    debugPrint('Edit profile pressed');
  }

  void _onSignOut(BuildContext context) {
    debugPrint('User signing out');
    context.goNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.border, // Light gray background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 33,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  border: Border(
                    bottom: BorderSide(color: AppColors.border, width: 1.18),
                  ),
                ),
                child: Column(
                  children: [
                    // Avatar with edit button
                    Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: AppColors.border,
                              width: 3.54,
                            ),
                            boxShadow: AppColors.cardShadow,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.asset(
                              'assets/images/d1de8b14dcdb224d3238629ee05b2850c42f6549.png',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: AppColors.primaryTint,
                                child: const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Edit button
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _onEditProfile,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3.54,
                                ),
                              ),
                              child: const Icon(
                                Icons.settings,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Name
                    const Text(
                      'Project Manager',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Subtitle
                    const Text(
                      'Senior Civil Engineer • Skyline Group',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Profile Info Cards
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
                child: Column(
                  children: [
                    _buildProfileCard(
                      icon: Icons.person_outline,
                      title: 'Personal Information',
                      subtitle: 'Update name, photo...',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    _buildProfileCard(
                      icon: Icons.email_outlined,
                      title: 'Email Address',
                      subtitle: 'manager@skyline.com',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    _buildProfileCard(
                      icon: Icons.phone_outlined,
                      title: 'Phone Number',
                      subtitle: '+91 98765 43210',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    _buildProfileCard(
                      icon: Icons.credit_card_outlined,
                      title: 'Subscription Plan',
                      subtitle: 'Enterprise (Admin)',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // Settings Section
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section header
                    const Text(
                      'SETTINGS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Settings card
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppRadius.xlRadius,
                        border: Border.all(
                          color: AppColors.border,
                          width: 1.18,
                        ),
                        boxShadow: AppColors.cardShadow,
                      ),
                      child: Column(
                        children: [
                          _buildSettingsItem(
                            icon: Icons.shield_outlined,
                            title: 'Privacy & Security',
                            onTap: () {},
                            showBorder: true,
                          ),
                          _buildSettingsItem(
                            icon: Icons.help_outline,
                            title: 'Help & Support',
                            onTap: () {},
                            showBorder: true,
                          ),
                          _buildSettingsItem(
                            icon: Icons.logout,
                            title: 'Sign Out',
                            onTap: () => _onSignOut(context),
                            isDestructive: true,
                            showBorder: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Version text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 34),
                child: Text(
                  'Version 2.4.0 (Stable)',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.borderDark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Bottom padding for nav bar
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 78,
        padding: const EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.xlRadius,
          border: Border.all(color: AppColors.border, width: 1.18),
          boxShadow: AppColors.cardShadow,
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: AppRadius.mediumRadius,
              ),
              child: Icon(icon, size: 18, color: AppColors.textSecondary),
            ),
            const SizedBox(width: 16),
            // Text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            // Chevron
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
    bool showBorder = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 73,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(
                  bottom: BorderSide(color: AppColors.border, width: 1.18),
                )
              : null,
        ),
        child: Row(
          children: [
            // Icon container
            SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Icon(
                  icon,
                  size: 18,
                  color: isDestructive
                      ? AppColors.error
                      : AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Text
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isDestructive
                      ? AppColors.error
                      : AppColors.textPrimary,
                ),
              ),
            ),
            // Chevron
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

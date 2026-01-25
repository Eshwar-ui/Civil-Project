import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/app_colors.dart';

/// Custom bottom navigation bar matching Figma design with custom SVG icons
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 1.18)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              iconPath: 'assets/icons/nav_home.svg',
              activeIconPath: 'assets/icons/nav_home_filled.svg',
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _NavItem(
              iconPath: 'assets/icons/nav_projects.svg',
              activeIconPath: 'assets/icons/nav_projects_filled.svg',
              label: 'Projects',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _NavItem(
              iconPath: 'assets/icons/nav_managers.svg',
              activeIconPath: 'assets/icons/nav_managers_filled.svg',
              label: 'Managers',
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            _NavItem(
              iconPath: 'assets/icons/nav_reports.svg',
              activeIconPath: 'assets/icons/nav_reports_filled.svg',
              label: 'Reports',
              isSelected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
            _NavItem(
              iconPath: 'assets/icons/nav_profile.svg',
              activeIconPath: 'assets/icons/nav_profile_filled.svg',
              label: 'Profile',
              isSelected: currentIndex == 4,
              onTap: () => onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconPath;
  final String activeIconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.iconPath,
    required this.activeIconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? activeIconPath : iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom nav bar with floating action button
/// Use this when you want the FAB integrated with the nav bar
class CustomBottomNavBarWithFAB extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onFABPressed;

  const CustomBottomNavBarWithFAB({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onFABPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Nav bar
        Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(
              top: BorderSide(color: AppColors.border, width: 1.18),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  iconPath: 'assets/icons/nav_home.svg',
                  activeIconPath: 'assets/icons/nav_home_filled.svg',
                  label: 'Home',
                  isSelected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                _NavItem(
                  iconPath: 'assets/icons/nav_projects.svg',
                  activeIconPath: 'assets/icons/nav_projects_filled.svg',
                  label: 'Projects',
                  isSelected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                _NavItem(
                  iconPath: 'assets/icons/nav_managers.svg',
                  activeIconPath: 'assets/icons/nav_managers_filled.svg',
                  label: 'Managers',
                  isSelected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
                _NavItem(
                  iconPath: 'assets/icons/nav_reports.svg',
                  activeIconPath: 'assets/icons/nav_reports_filled.svg',
                  label: 'Reports',
                  isSelected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
                _NavItem(
                  iconPath: 'assets/icons/nav_profile.svg',
                  activeIconPath: 'assets/icons/nav_profile_filled.svg',
                  label: 'Profile',
                  isSelected: currentIndex == 4,
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ),
        // FAB positioned above nav bar on the right
        Positioned(
          right: 24,
          top: -80,
          child: _FloatingAddButton(onPressed: onFABPressed),
        ),
      ],
    );
  }
}

class _FloatingAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _FloatingAddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8EC5FF).withOpacity(0.6),
              blurRadius: 15,
              spreadRadius: -3,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: const Color(0xFF8EC5FF).withOpacity(0.6),
              blurRadius: 6,
              spreadRadius: -4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/nav_add.svg',
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../core/app_colors.dart';

// ============================================================
// HEADERS
// ============================================================

/// Enterprise-style page header with back button and optional actions
class EnterpriseHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onBack;
  final List<Widget>? actions;

  const EnterpriseHeader({
    super.key,
    required this.title,
    this.subtitle,
    required this.onBack,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleIconButton(icon: Icons.arrow_back, onPressed: onBack),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: AppTypography.caption.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                Text(title, style: AppTypography.heading2),
              ],
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}

/// Section header with optional action button
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Color? actionColor;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
    this.actionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTypography.heading2),
        if (actionLabel != null && onAction != null)
          GestureDetector(
            onTap: onAction,
            child: Text(
              actionLabel!,
              style: AppTypography.link.copyWith(
                color: actionColor ?? AppColors.primary,
              ),
            ),
          ),
      ],
    );
  }
}

// ============================================================
// BUTTONS
// ============================================================

/// Circular icon button with border
class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final double size;
  final double iconSize;
  final bool showBadge;
  final Color? badgeColor;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.size = 44,
    this.iconSize = 20,
    this.showBadge = false,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.surfaceVariant,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? AppColors.border,
            width: 1.18,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor ?? AppColors.iconPrimary,
              ),
            ),
            if (showBadge)
              Positioned(
                top: size * 0.22,
                right: size * 0.22,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: badgeColor ?? AppColors.error,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Primary action button (full width)
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? AppColors.textOnPrimary,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.mediumRadius),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: AppTypography.bodyLarge.copyWith(
                      color: textColor ?? AppColors.textOnPrimary,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Secondary/outline button
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? borderColor;
  final Color? textColor;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor ?? AppColors.primary,
          side: BorderSide(color: borderColor ?? AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.mediumRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: AppTypography.bodyLarge.copyWith(
                color: textColor ?? AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CARDS
// ============================================================

/// Primary stat card (blue background)
class PrimaryStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? badge;
  final IconData icon;
  final VoidCallback? onTap;

  const PrimaryStatCard({
    super.key,
    required this.title,
    required this.value,
    this.badge,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 148,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: AppRadius.xlRadius,
          boxShadow: AppColors.primaryShadows,
        ),
        padding: AppSpacing.cardPaddingSmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: AppColors.overlayLight,
                    borderRadius: AppRadius.smallRadius,
                  ),
                  child: Icon(icon, color: Colors.white, size: 18),
                ),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.overlayLight,
                      borderRadius: AppRadius.fullRadius,
                    ),
                    child: Text(
                      badge!,
                      style: AppTypography.small.copyWith(
                        color: AppColors.textOnPrimary,
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: AppTypography.caption.copyWith(
                color: AppColors.textOnPrimaryMuted,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: AppTypography.statLarge.copyWith(
                color: AppColors.textOnPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Secondary stat card (white background)
class SecondaryStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  const SecondaryStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconBackgroundColor,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 148,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.xlRadius,
          border: Border.all(color: AppColors.border, width: 1.18),
          boxShadow: AppColors.cardShadow,
        ),
        padding: AppSpacing.cardPaddingSmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: iconBackgroundColor ?? AppColors.border,
                borderRadius: AppRadius.smallRadius,
              ),
              child: Icon(
                icon,
                color: iconColor ?? AppColors.textSecondary,
                size: 18,
              ),
            ),
            const Spacer(),
            Text(title, style: AppTypography.caption),
            const SizedBox(height: 4),
            Text(value, style: AppTypography.statLarge),
          ],
        ),
      ),
    );
  }
}

/// Operation card with icon
class OperationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const OperationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 129,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.xlRadius,
          border: Border.all(color: AppColors.border, width: 1.35),
          boxShadow: AppColors.cardShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: AppRadius.largeRadius,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(height: 12),
            Text(title, style: AppTypography.captionBold),
            const SizedBox(height: 2),
            Text(subtitle, style: AppTypography.tiny),
          ],
        ),
      ),
    );
  }
}

/// Project card with progress bar
class ProjectCard extends StatelessWidget {
  final String type;
  final String title;
  final double progress;
  final Color progressColor;
  final String? status;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.type,
    required this.title,
    required this.progress,
    required this.progressColor,
    this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSpacing.cardPadding,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.xlRadius,
          border: Border.all(color: AppColors.border, width: 1.18),
          boxShadow: AppColors.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type, style: AppTypography.caption),
                    const SizedBox(height: 4),
                    Text(title, style: AppTypography.heading3),
                  ],
                ),
                if (status != null)
                  StatusBadge(label: status!, color: progressColor),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Overall Progress', style: AppTypography.caption),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: AppTypography.captionBold,
                ),
              ],
            ),
            const SizedBox(height: 8),
            ProgressBar(progress: progress, color: progressColor),
          ],
        ),
      ),
    );
  }
}

/// Activity/operation item with emoji or icon
class ActivityItem extends StatelessWidget {
  final String emoji;
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final String time;
  final bool showBorder;
  final VoidCallback? onTap;

  const ActivityItem({
    super.key,
    required this.emoji,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    required this.time,
    this.showBorder = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSpacing.cardPaddingSmall,
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(
                  bottom: BorderSide(color: AppColors.border, width: 1.18),
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: AppRadius.mediumRadius,
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppTypography.bodyLarge),
                      Text(time, style: AppTypography.tiny),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTypography.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Activity item with icon instead of emoji
class ActivityItemWithIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final bool showBorder;
  final VoidCallback? onTap;

  const ActivityItemWithIcon({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    this.showBorder = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSpacing.cardPaddingSmall,
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(
                  bottom: BorderSide(color: AppColors.border, width: 1.18),
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: AppRadius.mediumRadius,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppTypography.bodyLarge),
                      Text(time, style: AppTypography.tiny),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTypography.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// BADGES & INDICATORS
// ============================================================

/// Status badge (Active, Pending, etc.)
class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const StatusBadge({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: AppRadius.fullRadius,
      ),
      child: Text(label, style: AppTypography.small.copyWith(color: color)),
    );
  }
}

/// Progress bar with rounded ends
class ProgressBar extends StatelessWidget {
  final double progress;
  final Color color;
  final double height;

  const ProgressBar({
    super.key,
    required this.progress,
    required this.color,
    this.height = 6,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.fullRadius,
      child: LinearProgressIndicator(
        value: progress.clamp(0.0, 1.0),
        backgroundColor: AppColors.border,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        minHeight: height,
      ),
    );
  }
}

// ============================================================
// CONTAINERS
// ============================================================

/// Card container with border and shadow
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const AppCard({super.key, required this.child, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? AppSpacing.cardPadding,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.xlRadius,
          border: Border.all(color: AppColors.border, width: 1.18),
          boxShadow: AppColors.cardShadow,
        ),
        child: child,
      ),
    );
  }
}

/// List container with rounded corners and border
class ListContainer extends StatelessWidget {
  final List<Widget> children;

  const ListContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.xxlRadius,
        border: Border.all(color: AppColors.border, width: 1.18),
      ),
      child: Column(children: children),
    );
  }
}

// ============================================================
// AVATARS
// ============================================================

/// Profile avatar with optional border
class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final Color? borderColor;
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.size = 44,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.18)
              : null,
        ),
        child: ClipOval(
          child: imageUrl != null
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildPlaceholder(),
                )
              : _buildPlaceholder(),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.primary.withOpacity(0.1),
      child: Icon(Icons.person, color: AppColors.primary, size: size * 0.55),
    );
  }
}

// ============================================================
// EMPTY STATE
// ============================================================

/// Empty state widget with icon and message
class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryTint,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 64,
                color: AppColors.primary.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: AppTypography.heading2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: AppTypography.bodySecondary.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 32),
              PrimaryButton(text: actionLabel!, onPressed: onAction),
            ],
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MANAGER/USER CARDS
// ============================================================

/// Manager card with avatar
class ManagerCard extends StatelessWidget {
  final String name;
  final String role;
  final String? imageUrl;
  final VoidCallback? onEdit;
  final VoidCallback? onTap;

  const ManagerCard({
    super.key,
    required this.name,
    required this.role,
    this.imageUrl,
    this.onEdit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSpacing.cardPaddingSmall,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.largeRadius,
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            ProfileAvatar(imageUrl: imageUrl, size: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTypography.bodyLarge),
                  Text(role, style: AppTypography.caption),
                ],
              ),
            ),
            if (onEdit != null)
              CircleIconButton(
                icon: Icons.edit_outlined,
                onPressed: onEdit!,
                size: 36,
                iconSize: 18,
                backgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                iconColor: AppColors.textSecondary,
              ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// LEGACY COMPONENTS (for backward compatibility)
// ============================================================

/// @deprecated Use [SecondaryStatCard] instead
class StatusStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? trend;
  final Color color;

  const StatusStatCard({
    super.key,
    required this.title,
    required this.value,
    this.trend,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.largeRadius,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.caption),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: AppTypography.statLarge),
              if (trend != null) StatusBadge(label: trend!, color: color),
            ],
          ),
        ],
      ),
    );
  }
}

/// @deprecated Use [ProjectCard] instead
class ProjectEnterpriseCard extends StatelessWidget {
  final String title;
  final String type;
  final double progress;
  final String status;
  final Color themeColor;
  final VoidCallback onTap;

  const ProjectEnterpriseCard({
    super.key,
    required this.title,
    required this.type,
    required this.progress,
    required this.status,
    required this.themeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ProjectCard(
      title: title,
      type: type,
      progress: progress,
      progressColor: themeColor,
      status: status,
      onTap: onTap,
    );
  }
}

// ============================================================
// FORM COMPONENTS
// ============================================================

/// Form text field matching Figma design exactly
class FormTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final bool enabled;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const FormTextField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.enabled = true,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: maxLines > 1 ? null : 48,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppRadius.mediumRadius,
            border: Border.all(color: AppColors.border, width: 1.18),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            enabled: enabled,
            onChanged: onChanged,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// APP BAR COMPONENTS
// ============================================================

/// Reusable app bar used across all screens. Change styling here to apply app-wide.
class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Simple string title. Ignored if [titleWidget] is non-null.
  final String? title;

  /// Custom title widget (e.g. Column with title + status). Takes precedence over [title].
  final Widget? titleWidget;
  final VoidCallback? onBack;
  final Widget? action;
  final bool centerTitle;

  /// Whether to show the bottom border line. Default true.
  final bool showBottomBorder;

  /// Background color. Default is surface style.
  final Color? backgroundColor;

  const ModernAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.onBack,
    this.action,
    this.centerTitle = true,
    this.showBottomBorder = true,
    this.backgroundColor,
  });

  /// App bar with project-style title and optional SITE ACTIVE tag.
  factory ModernAppBar.projectHeader({
    Key? key,
    required String title,
    double titleFontSize = 26,
    bool showSiteActive = true,
    VoidCallback? onBack,
    Widget? action,
  }) {
    return ModernAppBar(
      centerTitle: true,
      key: key,
      titleWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: -0.65,
            ),
          ),
          if (showSiteActive) ...[
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'SITE ACTIVE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.success,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
      onBack: onBack,
      action: action,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget titleChild = titleWidget != null
        ? titleWidget!
        : (title != null && title!.isNotEmpty)
        ? Text(
            title!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: -0.65,
            ),
          )
        : const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 0),
      child: AppBar(
        backgroundColor: backgroundColor ?? Colors.white.withOpacity(0.9),
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.1),
        surfaceTintColor: Colors.transparent,
        leading: onBack != null
            ? _AppBarIconButton(icon: Icons.arrow_back, onPressed: onBack!)
            : null,
        title: titleChild,
        centerTitle: centerTitle,
        actions: action != null
            ? [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: action!,
                ),
              ]
            : centerTitle
            ? [const SizedBox(width: 48)]
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(76);
}

/// Styled action button for use in [ModernAppBar]. Use for edit, etc.
Widget appBarActionButton({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: AppColors.surfaceVariant,
      borderRadius: AppRadius.largeRadius,
      border: Border.all(color: AppColors.border, width: 1.18),
    ),
    child: IconButton(
      icon: Icon(icon, size: 24, color: AppColors.textSecondary),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
    ),
  );
}

/// AppBar icon button with rounded square shape matching Figma
class _AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _AppBarIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        // color: AppColors.surfaceVariant,
        borderRadius: AppRadius.largeRadius,
        // border: Border.all(color: AppColors.border, width: 1.18),
      ),
      child: IconButton(
        icon: Icon(icon, size: 24, color: AppColors.textSecondary),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

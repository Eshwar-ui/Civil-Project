import 'package:flutter/material.dart';

/// Design system colors extracted from Figma
/// Use these constants throughout the app for consistency
class AppColors {
  AppColors._();

  // ============ PRIMARY COLORS ============
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1D4ED8);

  // Primary tints (for backgrounds)
  static const Color primaryTint = Color(0xFFEBF2FF);
  static const Color primaryShadow = Color(0xFF8EC5FF);
  static const Color primaryShadowLight = Color(0xFFBEDBFF);

  // ============ SEMANTIC COLORS ============
  static const Color success = Color(0xFF1DB954);
  static const Color successLight = Color(0xFF22C55E);
  static const Color successTint = Color(0xFFF0FDF4);
  static const Color successButtonTint = Color(0xFFE6F6EB); // Light green button bg

  static const Color warning = Color(0xFFFBBF24);
  static const Color warningLight = Color(0xFFF59E0B);
  static const Color warningTint = Color(0xFFFEF3E2);
  static const Color warningTintAlt = Color(0xFFFEFCE8);

  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFF87171);
  static const Color errorTint = Color(0xFFFFF1F2);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoTint = Color(0xFFEFF6FF);

  // ============ NEUTRAL COLORS ============
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF8FAFC);

  // Border colors
  static const Color border = Color(0xFFF1F5F9);
  static const Color borderMedium = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFFCBD5E1);

  // ============ TEXT COLORS ============
  static const Color textPrimary = Color(0xFF0F172B);
  static const Color textSecondary = Color(0xFF90A1B9);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnPrimaryMuted = Color(0xB3FFFFFF); // 70% white

  // ============ ICON COLORS ============
  static const Color iconPrimary = Color(0xFF0F172B);
  static const Color iconSecondary = Color(0xFF90A1B9);
  static const Color iconOnPrimary = Color(0xFFFFFFFF);

  // ============ OVERLAY COLORS ============
  static const Color overlayLight = Color(0x33FFFFFF); // 20% white
  static const Color overlayDark = Color(0x1A000000); // 10% black
  static const Color scrim = Color(0x80000000); // 50% black

  // ============ STATUS BADGE COLORS ============
  static Color statusActiveBlue = primary.withOpacity(0.08);
  static Color statusActiveGreen = success.withOpacity(0.08);
  static Color statusActiveYellow = warning.withOpacity(0.08);
  static Color statusActiveRed = error.withOpacity(0.08);

  // ============ HELPER METHODS ============
  /// Get tint color for a given accent color
  static Color getTintForColor(Color color) {
    if (color == primary || color == primaryLight) return primaryTint;
    if (color == success || color == successLight) return successTint;
    if (color == warning || color == warningLight) return warningTint;
    if (color == error || color == errorLight) return errorTint;
    return color.withOpacity(0.08);
  }

  /// Get shadow color for primary elements
  static List<BoxShadow> primaryShadows = [
    BoxShadow(
      color: primaryShadowLight.withOpacity(0.8),
      blurRadius: 15,
      spreadRadius: -3,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: primaryShadowLight.withOpacity(0.8),
      blurRadius: 6,
      spreadRadius: -4,
      offset: const Offset(0, 4),
    ),
  ];

  /// Subtle card shadow
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 2,
      spreadRadius: -1,
      offset: const Offset(0, 1),
    ),
  ];

  /// FAB shadow
  static List<BoxShadow> fabShadow = [
    BoxShadow(
      color: primaryShadow.withOpacity(0.5),
      blurRadius: 15,
      spreadRadius: -3,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: primaryShadow.withOpacity(0.5),
      blurRadius: 6,
      spreadRadius: -4,
      offset: const Offset(0, 4),
    ),
  ];
}

/// Design system spacing values
class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;

  // Screen padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsets screenPaddingAll = EdgeInsets.all(24);

  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(20);
  static const EdgeInsets cardPaddingSmall = EdgeInsets.all(16);
}

/// Design system border radius values
class AppRadius {
  AppRadius._();

  static const double sm = 10.0;
  static const double md = 14.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double full = 100.0;

  static BorderRadius get smallRadius => BorderRadius.circular(sm);
  static BorderRadius get mediumRadius => BorderRadius.circular(md);
  static BorderRadius get largeRadius => BorderRadius.circular(lg);
  static BorderRadius get xlRadius => BorderRadius.circular(xl);
  static BorderRadius get xxlRadius => BorderRadius.circular(xxl);
  static BorderRadius get fullRadius => BorderRadius.circular(full);
}

/// Design system typography
class AppTypography {
  AppTypography._();

  // Font family - using system font, can be changed to custom font
  static const String fontFamily = 'Arial';

  // Heading styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Caption styles
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle captionBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Small styles
  static const TextStyle small = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle tiny = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Stat/Number styles
  static const TextStyle statLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle statMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // Link/Action styles
  static const TextStyle link = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.4,
  );
}

import 'package:flutter/material.dart';

/// Centralized color palette.
/// NOTE: These are approximate values inferred from the Figma screenshot.
/// Replace with exact hex codes once you pull them from Figma's Inspect panel.
class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF0D1B2A);
  static const Color surface = Color(0xFF16293D);
  static const Color surfaceElevated = Color(0xFF1E3A52);

  // Accent
  static const Color primary = Color(0xFF2D9CDB);
  static const Color primaryLight = Color(0xFF56CCF2);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textMuted = Color(0xFF78909C);

  // Status / states
  static const Color success = Color(0xFF27AE60);
  static const Color error = Color(0xFFEB5757);
  static const Color warning = Color(0xFFF2C94C);
  static const Color badge = Color(0xFFF2994A);

  // Utility
  static const Color divider = Color(0xFF263A4E);
  static const Color overlay = Color(0x99000000);
}

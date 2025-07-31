// lib/core/theme/app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // App Basic Colors
  static const Color primary = Color(0xFFF08FAF);
  static const Color secondary = Color(0xFFFFF3F7);
  static const Color tertiaryColor = Color(
    0xFFF3F4F6,
  ); // Light Gray - Neutral Background
  static const Color tetraColor = Color(
    0xFFF97316,
  ); // Orange - Alerts/Highlights
  static const Color pentaColor = Color(
    0xFF14B8A6,
  ); // Teal - Interactive elements
  static const Color hexaColor = Color(
    0xFFF9FAFB,
  ); // Lightest Gray - Backgrounds
  static const Color accent = Color(
    0xFF0F172A,
  ); // Dark Navy - Accents and Depth

  // Gradient Colors
  static const Gradient primaryLinerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF08FAF), Color(0xFFFFDAE6), Color(0xFFF7F7F7)],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A); // Deep Navy
  static const Color textSecondary = Color(0xFF475569); // Slate Gray
  static const Color textWhite = Colors.white;
  static const Color textBlue = Color(0xFF2563EB); // Emphasis Blue

  // Background Colors
  static const Color light = Color(0xFFF3F4F6); // Light Gray
  static const Color dark = Color(0xFF1E293B); // Dark Blue Gray
  static const Color primaryBackground = Color(0xFFE5E7EB); // Subtle Gray

  // Background Container Colors
  static const Color lightContainer = Color(0xFFCBD5E1); // Soft Gray
  static Color darkContainer = textWhite.withOpacity(0.08);

  // Button Colors
  static const Color buttonPrimary = Color(0xFFF08FAF);
  static const Color buttonSecondary = Color(0xFF3B82F6); // Blue
  static const Color buttonDisabled = Color(0xFFCBD5E1); // Muted Gray
  static const LinearGradient buttonActiveLinearGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1E3A8A), Color(0xFF1E293B)],
  );
  static const LinearGradient buttonInActiveLinearGradientColor =
      LinearGradient(colors: [Colors.grey, Colors.grey]);

  // Border Colors
  static const Color borderPrimary = Color(0xFF94A3B8); // Gray Blue
  static const Color borderSecondary = Color(0xFFE2E8F0); // Light Gray

  // Error and Validation Colors
  static const Color error = Color(0xFFDC2626); // Red - Critical
  static const Color success = Color(0xFF16A34A); // Green - Success
  static const Color warning = Color(0xFFF59E0B); // Amber - Warning
  static const Color info = Color(0xFF3B82F6); // Blue - Info

  // Neutral Shades
  static const Color fullBlack = Color(0xFF000000);
  static const Color black = Color(0xFF1F2937);
  static const Color darkerGrey = Color(0xFF374151);
  static const Color darkGrey = Color(0xFF6B7280);
  static const Color grey = Color(0xFFD1D5DB);
  static const Color softGrey = Color(0xFF828282);
  static const Color lightGrey = Color(0xFFF3F4F6);
  static const Color white = Color(0xFFFFFFFF);

  // Status Indicator Colors
  static const Color temperatureRed = Color(0xFFEF4444); // High temp
  static const Color moistureBlue = Color(0xFF3B82F6); // Moisture
  static const Color lightYellow = Color(0xFFFACC15); // Light intensity
  static const Color phPurple = Color(0xFFA855F7); // pH
  static const Color nutrientGreen = Color(0xFF22C55E); // Nutrients

  // Progress Stages (e.g., workflow)
  static const Color stagePending = Color(0xFF64748B); // Gray - Pending
  static const Color stageActive = Color(0xFF2563EB); // Blue - In Progress
  static const Color stageReview = Color(0xFFF59E0B); // Amber - Review
  static const Color stageApproved = Color(0xFF10B981); // Green - Approved
  static const Color stageRejected = Color(0xFFEF4444); // Red - Rejected

  // Sensor Value Status Colors
  static const Color optimalValue = Color(0xFF10B981); // Optimal
  static const Color warningValue = Color(0xFFF59E0B); // Warning
  static const Color criticalValue = Color(0xFFDC2626); // Critical
  static const Color inactiveValue = Color(0xFF9CA3AF); // Inactive
}

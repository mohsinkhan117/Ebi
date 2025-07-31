// lib/core/theme/custom_theme/outlined_button_theme.dart

/*
-- Light & Dark Outlined Button Themes */
import 'package:ebi_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._(); //To avoid creating instances

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
      side: const BorderSide(color: AppColors.primary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    ),
    // DutlinedButtonTheme Data
  );

  /* Dark Theme */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.white,
      side: const BorderSide(color: AppColors.primary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}

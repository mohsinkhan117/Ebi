// lib/core/theme/custom_theme/elevated_button_theme.dart

import 'package:ebi_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.buttonDisabled,
      disabledForegroundColor: AppColors.darkerGrey,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.darkGrey,
      disabledForegroundColor: AppColors.grey,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

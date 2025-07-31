// lib/core/theme/custom_theme/text_theme.dart

import 'package:ebi_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  // Light Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
    ),
  );

  //  Dark Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.grey,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.grey,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: AppColors.grey,
    ),
  );
}

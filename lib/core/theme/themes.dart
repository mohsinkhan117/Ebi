// lib/core/theme/themes.dart

import 'package:ebi_project/core/theme/app_colors.dart';
import 'package:ebi_project/core/theme/custom_theme/appbar_theme.dart';
import 'package:ebi_project/core/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:ebi_project/core/theme/custom_theme/checkbox_theme.dart';
import 'package:ebi_project/core/theme/custom_theme/chip_theme.dart';
import 'package:ebi_project/core/theme/custom_theme/elevated_button_theme.dart';
import 'package:ebi_project/core/theme/custom_theme/outlined_button_theme.dart';
import 'package:ebi_project/core/theme/custom_theme/text_field_theme.dart';
import 'package:ebi_project/core/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.tertiaryColor,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiaryColor,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      surface: AppColors.white,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.white,
      elevation: 2,
      shadowColor: AppColors.softGrey,
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.darkGrey,
      indicatorColor: AppColors.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      surface: Color(0xFF1B5E20),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF2E7D32),
      elevation: 2,
      shadowColor: AppColors.black,
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.secondary,
      unselectedLabelColor: AppColors.grey,
      indicatorColor: AppColors.secondary,
    ),
  );
}

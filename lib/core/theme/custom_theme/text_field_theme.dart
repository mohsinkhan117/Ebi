// lib/core/theme/custom_theme/text_field_theme.dart

import 'package:ebi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.textPrimary,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.softGrey,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      color: AppColors.error,
    ),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColors.primary),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(width: 1, color: AppColors.borderPrimary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(width: 1, color: AppColors.primary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(width: 1.5, color: AppColors.grey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
    filled: true,
    fillColor: AppColors.white,
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.softGrey,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      color: AppColors.error,
    ),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColors.primary),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.primary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1.5, color: AppColors.grey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
    filled: true,
    fillColor: AppColors.darkContainer,
  );
}

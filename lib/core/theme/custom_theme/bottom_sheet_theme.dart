// lib/core/theme/custom_theme/bottom_sheet_theme.dart

import 'package:ebi_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomSheetTheme {
  AppBottomSheetTheme._();
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.white,
    modalBackgroundColor: AppColors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.dark,
    modalBackgroundColor: AppColors.dark,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
  // BottomSheet Theme Data
}

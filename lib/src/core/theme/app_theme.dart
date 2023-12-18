import 'package:financial_goal_detail/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  ThemeData get themeData {
    return ThemeData(
      primaryColor: AppColors.blue,
      canvasColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      splashColor: AppColors.transparent,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.green),
    );
  }
}

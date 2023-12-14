import 'package:financial_goal_detail/src/core/constants/colors.dart';
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
          const ProgressIndicatorThemeData(color: AppColors.payneGreyColor),
      dividerColor: AppColors.dividerColor,
    );
  }

  // AppBarTheme get appBarTheme {
  //   return const AppBarTheme(
  //     iconTheme: IconThemeData(
  //       color: AppColors.black,
  //     ),
  //     elevation: 0,
  //     toolbarHeight: 64,
  //     backgroundColor: AppColors.payneGreyColor,
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarIconBrightness: Brightness.dark,
  //       statusBarBrightness: Brightness.light,
  //     ),
  //   );
  // }
}

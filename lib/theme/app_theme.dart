import 'package:flutter/material.dart';
import 'package:myapp/theme/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary)));
}

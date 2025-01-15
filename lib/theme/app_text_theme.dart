import 'package:flutter/material.dart';
import 'package:myapp/theme/app_colors.dart';

class AppTextTheme {
  static const h5 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.8);
  static const h6 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.8);

  static const bodySM = TextStyle(fontSize: 14, height: 1.8);

  static const buttonMD = TextStyle(fontSize: 14, height: 1.71);

  static const captionMD = TextStyle(fontSize: 12, height: 1.8);

  static final textError = captionMD.copyWith(color: AppColors.error);
}

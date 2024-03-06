import 'package:firebase_wp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const black16W500 = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const grey14W400 = TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle grey12W400 = TextStyle(
    color: AppColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

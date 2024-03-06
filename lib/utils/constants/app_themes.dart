import 'package:flutter/material.dart';

import '../configs.dart';
import '../extensions/color_extensions.dart';
import 'app_colors.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData get appTheme => ThemeData(
        useMaterial3: true,
        fontFamily: Configs.appFontFamily,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.primary.toMaterialColor,
          backgroundColor: AppColors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
        ),
        dropdownMenuTheme: const DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.white),
            surfaceTintColor: MaterialStatePropertyAll(AppColors.white),
          ),
        ),
      );
}

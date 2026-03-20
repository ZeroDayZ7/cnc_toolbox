import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_design.dart';

class AppTheme {
  // Dodajemy parametr Brightness do gettera
  static InputDecorationTheme _inputTheme(Brightness brightness) =>
      InputDecorationTheme(
        prefixIconColor: AppColors.primary,
        suffixIconColor: AppColors.primary,
        filled: true,
        fillColor: brightness == Brightness.dark
            ? AppColors.surfaceDark
            : Colors.white,
        border: OutlineInputBorder(borderRadius: AppRadii.radiusM),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacings.m,
          vertical: AppSpacings.m,
        ),
      );

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primary,
    inputDecorationTheme: _inputTheme(Brightness.light),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgDark,
    inputDecorationTheme: _inputTheme(Brightness.dark),
  );
}

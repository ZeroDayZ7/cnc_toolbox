import 'package:cnc_toolbox/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_design.dart';

/// Centralized theme configuration for the application.
///
/// Defines global styles for Light and Dark modes, ensuring UI consistency
/// by leveraging [AppColors] and [AppDesign] constants.
class AppTheme {
  /// Generates a consistent [InputDecorationTheme] based on the current [brightness].
  ///
  /// This ensures that all TextFields in the app share the same padding,
  /// border radii, and background colors, while adapting to light/dark surfaces.
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

  /// Configures the Light Theme.
  /// Uses [AppColors.primary] as the seed for a cohesive Material 3 ColorScheme.
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primary,
    inputDecorationTheme: _inputTheme(Brightness.light),
    extensions: [
      CncColors(
        toolStatus: AppColors.statusReady,
        machineActive: AppColors.statusWorking,
      ),
    ],
  );

  /// Configures the Dark Theme.
  /// Overrides the scaffold background to match [AppColors.bgDark]
  /// for a more tailored dark mode experience.
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgDark,
    inputDecorationTheme: _inputTheme(Brightness.dark),
    extensions: [
      CncColors(
        toolStatus: AppColors.statusReady.withValues(alpha: 0.8),
        machineActive: AppColors.accent,
      ),
    ],
  );
}

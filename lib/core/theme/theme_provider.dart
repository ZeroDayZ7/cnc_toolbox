import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<ThemeMode> {
  static const _themeKey = 'isDarkMode';

  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPrefsProvider);

    final isDark = prefs.getBool(_themeKey) ?? false;

    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme(bool isDark) async {
    final prefs = ref.read(sharedPrefsProvider);

    state = isDark ? ThemeMode.dark : ThemeMode.light;

    await prefs.setBool(_themeKey, isDark);
  }
}

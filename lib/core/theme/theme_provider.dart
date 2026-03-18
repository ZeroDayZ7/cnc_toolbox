import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPrefsProvider);
    final isDark = prefs.getBool(PreferencesKeys.isDarkMode) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme(bool isDark) async {
    final prefs = ref.read(sharedPrefsProvider);
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool(PreferencesKeys.isDarkMode, isDark);
  }
}

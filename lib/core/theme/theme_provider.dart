import 'package:cnc_toolbox/core/local_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

/// Notifier responsible for managing and persisting the application's visual theme.
///
/// It synchronizes the current [ThemeMode] with local storage to ensure
/// the user's preference (Light/Dark mode) is preserved across app restarts.
@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  /// Initializes the theme state by reading the saved preference from [LocalSettingsRepository].
  /// Defaults to [ThemeMode.light] if no preference is found.
  ThemeMode build() {
    final repo = ref.watch(localSettingsRepositoryProvider);

    if (!repo.hasThemeConfig()) {
      return ThemeMode.system;
    }
    final bool isDarkModeSaved = repo.getIsDarkMode();
    return isDarkModeSaved ? ThemeMode.dark : ThemeMode.light;
  }

  /// Toggles the application theme and persists the choice to local storage.
  ///
  /// [isDark] - If true, sets the theme to [ThemeMode.dark], otherwise [ThemeMode.light].
  Future<void> toggleTheme(bool isDark) async {
    state = isDark ? ThemeMode.dark : ThemeMode.light;

    // Asynchronously update local storage to reflect the new theme choice
    await ref.read(localSettingsRepositoryProvider).setIsDarkMode(isDark);
  }
}

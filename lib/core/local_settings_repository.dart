import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_settings_repository.g.dart';

/// Provider for the [LocalSettingsRepository] instance.
///
/// Depends on [sharedPrefsProvider] to access the underlying storage engine.
@Riverpod(keepAlive: true)
LocalSettingsRepository localSettingsRepository(Ref ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return LocalSettingsRepository(prefs);
}

/// A repository class that handles persistence of local application settings.
///
/// It abstracts the [SharedPreferences] implementation, providing a type-safe
/// API for managing UI preferences and unit configuration.
class LocalSettingsRepository {
  final SharedPreferences _prefs;
  LocalSettingsRepository(this._prefs);

  // --- THEME ---

  /// Checks if a theme preference has been explicitly saved.
  bool hasThemeConfig() => _prefs.containsKey(PreferencesKeys.isDarkMode);

  /// Retrieves the saved theme preference. Returns `false` (Light Mode) by default.
  bool getIsDarkMode() => _prefs.getBool(PreferencesKeys.isDarkMode) ?? false;

  /// Persists the user's theme preference (Dark vs Light).
  Future<void> setIsDarkMode(bool value) =>
      _prefs.setBool(PreferencesKeys.isDarkMode, value);

  // --- SIDEBAR ---

  /// Checks if the navigation sidebar should be expanded or collapsed.
  bool getSidebarExpanded() =>
      _prefs.getBool(PreferencesKeys.sidebarExpanded) ?? true;

  /// Saves the current sidebar expansion state.
  Future<void> setSidebarExpanded(bool value) =>
      _prefs.setBool(PreferencesKeys.sidebarExpanded, value);

  // --- CONVERTER UNITS ---

  /// Retrieves a map of visible units for each converter category.
  ///
  /// Iterates through stored keys using [PreferencesKeys.unitsKeyPrefix],
  /// decodes the JSON arrays, and returns them as a structured Map.
  Map<String, List<String>> getVisibleUnits() {
    final Map<String, List<String>> unitsMap = {};
    for (final key in _prefs.getKeys()) {
      if (key.startsWith(PreferencesKeys.unitsKeyPrefix)) {
        final category = key.replaceFirst(PreferencesKeys.unitsKeyPrefix, '');
        final jsonString = _prefs.getString(key);
        if (jsonString != null) {
          final List decoded = jsonDecode(jsonString);
          unitsMap[category] = decoded.cast<String>();
        }
      }
    }
    return unitsMap;
  }

  /// Stores a list of active unit IDs for a specific [category].
  ///
  /// Encodes the list into a JSON string before saving to local storage.
  Future<void> setVisibleUnits(String category, List<String> unitIds) async {
    final key = '${PreferencesKeys.unitsKeyPrefix}$category';
    await _prefs.setString(key, jsonEncode(unitIds));
  }
}

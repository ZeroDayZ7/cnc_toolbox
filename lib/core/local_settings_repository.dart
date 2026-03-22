import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_settings_repository.g.dart';

/// Provider for the [LocalSettingsRepository] instance.
@Riverpod(keepAlive: true)
LocalSettingsRepository localSettingsRepository(Ref ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return LocalSettingsRepository(prefs);
}

/// A repository class that handles persistence of local application settings.
class LocalSettingsRepository {
  final SharedPreferences _prefs;
  LocalSettingsRepository(this._prefs);

  // --- THEME ---

  bool hasThemeConfig() => _prefs.containsKey(PreferencesKeys.isDarkMode);

  bool getIsDarkMode() => _prefs.getBool(PreferencesKeys.isDarkMode) ?? false;

  /// Persists the user's theme preference.
  /// Returns [Result] to handle potential storage errors.
  Future<Result<void>> setIsDarkMode(bool value) async {
    try {
      await _prefs.setBool(PreferencesKeys.isDarkMode, value);
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  // --- SIDEBAR ---

  bool getSidebarExpanded() =>
      _prefs.getBool(PreferencesKeys.sidebarExpanded) ?? true;

  /// Saves the current sidebar expansion state.
  Future<Result<void>> setSidebarExpanded(bool value) async {
    try {
      await _prefs.setBool(PreferencesKeys.sidebarExpanded, value);
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  // --- CONVERTER UNITS ---

  Map<String, List<String>> getVisibleUnits() {
    final Map<String, List<String>> unitsMap = {};
    try {
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
    } catch (_) {
      // W przypadku błędu odczytu (np. uszkodzony JSON), zwracamy pustą mapę
      return {};
    }
    return unitsMap;
  }

  /// Stores a list of active unit IDs for a specific [category].
  Future<Result<void>> setVisibleUnits(
    String category,
    List<String> unitIds,
  ) async {
    try {
      final key = '${PreferencesKeys.unitsKeyPrefix}$category';
      await _prefs.setString(key, jsonEncode(unitIds));
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }
}

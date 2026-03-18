import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:cnc_toolbox/features/converter/domain/settings_state.dart'; // Import nowego stanu
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'converter_settings_provider.g.dart';

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsState build() {
    final prefs = ref.watch(sharedPrefsProvider);
    return _loadInitialState(prefs);
  }

  SettingsState _loadInitialState(SharedPreferences prefs) {
    final isExpanded = prefs.getBool(PreferencesKeys.sidebarExpanded) ?? true;
    final Map<String, List<String>> unitsMap = {};

    for (final key in prefs.getKeys()) {
      if (key.startsWith(PreferencesKeys.unitsKeyPrefix)) {
        final category = key.replaceFirst(PreferencesKeys.unitsKeyPrefix, '');
        final jsonString = prefs.getString(key);
        if (jsonString != null) {
          final List decoded = jsonDecode(jsonString);
          unitsMap[category] = decoded.cast<String>();
        }
      }
    }
    return SettingsState(isSidebarExpanded: isExpanded, visibleUnits: unitsMap);
  }

  Future<void> toggleSidebar() async {
    final prefs = ref.read(sharedPrefsProvider);
    final newValue = !state.isSidebarExpanded;
    await prefs.setBool(PreferencesKeys.sidebarExpanded, newValue);
    state = state.copyWith(isSidebarExpanded: newValue);
  }

  Future<void> toggleUnit(String category, String unitId) async {
    final prefs = ref.read(sharedPrefsProvider);
    final current = state.visibleUnits[category] ?? [];
    final updated = current.contains(unitId)
        ? current.where((e) => e != unitId).toList()
        : [...current, unitId];

    final key = '${PreferencesKeys.unitsKeyPrefix}$category';
    await prefs.setString(key, jsonEncode(updated));

    state = state.copyWith(
      visibleUnits: {...state.visibleUnits, category: updated},
    );
  }
}

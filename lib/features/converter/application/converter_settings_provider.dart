import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'converter_settings_provider.g.dart';

class SettingsState {
  final bool isSidebarExpanded;
  final Map<String, List<String>> visibleUnits;

  const SettingsState({
    this.isSidebarExpanded = true,
    this.visibleUnits = const {},
  });

  SettingsState copyWith({
    bool? isSidebarExpanded,
    Map<String, List<String>>? visibleUnits,
  }) {
    return SettingsState(
      isSidebarExpanded: isSidebarExpanded ?? this.isSidebarExpanded,
      visibleUnits: visibleUnits ?? this.visibleUnits,
    );
  }

  bool isUnitVisible(String category, String unitId) {
    final current = visibleUnits[category];
    if (current == null || current.isEmpty) return true;
    return current.contains(unitId);
  }
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  static const _sidebarKey = 'sidebar_expanded';
  static const _unitsKeyPrefix = 'units_';

  @override
  SettingsState build() {
    _load();
    return const SettingsState();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final isExpanded = prefs.getBool(_sidebarKey) ?? true;

    final Map<String, List<String>> unitsMap = {};
    for (final key in prefs.getKeys()) {
      if (key.startsWith(_unitsKeyPrefix)) {
        final category = key.replaceFirst(_unitsKeyPrefix, '');
        final jsonString = prefs.getString(key);
        if (jsonString != null) {
          final List decoded = jsonDecode(jsonString);
          unitsMap[category] = decoded.cast<String>();
        }
      }
    }

    state = state.copyWith(
      isSidebarExpanded: isExpanded,
      visibleUnits: unitsMap,
    );
  }

  Future<void> toggleSidebar() async {
    final prefs = await SharedPreferences.getInstance();
    final newValue = !state.isSidebarExpanded;
    await prefs.setBool(_sidebarKey, newValue);
    state = state.copyWith(isSidebarExpanded: newValue);
  }

  Future<void> toggleUnit(String category, String unitId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = state.visibleUnits[category] ?? [];
    final updated = current.contains(unitId)
        ? current.where((e) => e != unitId).toList()
        : [...current, unitId];

    await prefs.setString('$_unitsKeyPrefix$category', jsonEncode(updated));

    state = state.copyWith(
      visibleUnits: {...state.visibleUnits, category: updated},
    );
  }
}

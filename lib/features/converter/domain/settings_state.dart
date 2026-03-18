import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(true) bool isSidebarExpanded,
    @Default({}) Map<String, List<String>> visibleUnits,
  }) = _SettingsState;

  // Pozwala na dodanie własnych metod do klasy Freezed
  const SettingsState._();

  bool isUnitVisible(String category, String unitId) {
    final current = visibleUnits[category];
    if (current == null || current.isEmpty) return true;
    return current.contains(unitId);
  }
}

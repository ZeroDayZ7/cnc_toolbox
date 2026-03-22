// lib/features/converter/application/converter_settings_provider.dart
import 'package:cnc_toolbox/core/local_settings_repository.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/converter/domain/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'converter_settings_provider.g.dart';

/// Notifier responsible for managing UI-related preferences and configuration.
@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsState build() {
    final repo = ref.watch(localSettingsRepositoryProvider);

    return SettingsState(
      isSidebarExpanded: repo.getSidebarExpanded(),
      visibleUnits: repo.getVisibleUnits(),
    );
  }

  /// Toggles the navigation sidebar expansion state and persists the change.
  Future<void> toggleSidebar() async {
    final repo = ref.read(localSettingsRepositoryProvider);
    final oldValue = state.isSidebarExpanded;
    final newValue = !oldValue;

    // 1. Optimistic update
    state = state.copyWith(isSidebarExpanded: newValue);

    // 2. Background persistence
    final result = await repo.setSidebarExpanded(newValue);

    // 3. Rollback on failure using pattern matching
    if (result case Failure(error: final e)) {
      state = state.copyWith(isSidebarExpanded: oldValue);
      _logError("Failed to persist sidebar state", e);
    }
  }

  /// Adds or removes a unit from the visible list and persists the change.
  Future<void> toggleUnit(String category, String unitId) async {
    final repo = ref.read(localSettingsRepositoryProvider);
    final previousVisibleUnits = state.visibleUnits;

    final currentList = previousVisibleUnits[category] ?? [];
    final updatedList = currentList.contains(unitId)
        ? currentList.where((e) => e != unitId).toList()
        : [...currentList, unitId];

    // 1. Optimistic update
    state = state.copyWith(
      visibleUnits: {...previousVisibleUnits, category: updatedList},
    );

    // 2. Background persistence
    final result = await repo.setVisibleUnits(category, updatedList);

    // 3. Rollback on failure using pattern matching
    if (result case Failure(error: final e)) {
      state = state.copyWith(visibleUnits: previousVisibleUnits);
      _logError("Failed to save unit visibility settings", e);
    }
  }

  /// Private helper to keep the logging consistent
  void _logError(String message, Object error) {
    ref.read(appLoggerProvider).e(message, error: error, module: "SETTINGS");
  }
}

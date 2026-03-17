// features/converter/application/converter_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/converter_state.dart';
import '../domain/unit_model.dart';

part 'converter_provider.g.dart';

@riverpod
class ConverterNotifier extends _$ConverterNotifier {
  @override
  ConverterState build(String category) {
    return const ConverterState();
  }

  void updateValue(String unitId, String value, List<UnitDefinition> allUnits) {
    if (value.isEmpty) {
      state = state.copyWith(values: {});
      return;
    }

    final double? inputValue = double.tryParse(value.replaceAll(',', '.'));
    if (inputValue == null) return;

    // 1. Znajdź definicję jednostki, którą user edytuje
    final currentUnit = allUnits.firstWhere((u) => u.id == unitId);

    // 2. Przelicz na bazę (np. na metry)
    final double baseValue = inputValue * currentUnit.ratio;

    // 3. Przelicz z bazy na wszystkie pozostałe
    final Map<String, String> newValues = {};
    for (var unit in allUnits) {
      if (unit.id == unitId) {
        newValues[unit.id] =
            value; // Zostaw wpisany tekst (żeby nie psuć kropki)
      } else {
        final double converted = baseValue / unit.ratio;
        // Formatowanie: usuń zbędne zera po przecinku
        newValues[unit.id] = converted
            .toStringAsFixed(6)
            .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
      }
    }

    state = state.copyWith(values: newValues);
  }
}

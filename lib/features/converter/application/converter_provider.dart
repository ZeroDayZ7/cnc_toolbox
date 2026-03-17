import 'package:cnc_toolbox/features/converter/domain/converter_state.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'converter_provider.g.dart';

@Riverpod(keepAlive: true)
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

    final Map<String, String> newValues = {};

    if (category == 'temp') {
      double celsius;
      switch (unitId) {
        case 'fahrenheit':
          celsius = (inputValue - 32) / 1.8;
          break;
        case 'kelvin':
          celsius = inputValue - 273.15;
          break;
        default:
          celsius = inputValue;
      }

      for (var unit in allUnits) {
        if (unit.id == unitId) {
          newValues[unit.id] = value;
        } else {
          double converted;
          switch (unit.id) {
            case 'fahrenheit':
              converted = (celsius * 1.8) + 32;
              break;
            case 'kelvin':
              converted = celsius + 273.15;
              break;
            default:
              converted = celsius;
          }
          newValues[unit.id] = _formatValue(converted);
        }
      }
    } else {
      final currentUnit = allUnits.firstWhere((u) => u.id == unitId);
      final double baseValue = inputValue * currentUnit.ratio;

      for (var unit in allUnits) {
        if (unit.id == unitId) {
          newValues[unit.id] = value;
        } else {
          final double converted = baseValue / unit.ratio;
          newValues[unit.id] = _formatValue(converted);
        }
      }
    }

    state = state.copyWith(values: newValues);
  }

  String _formatValue(double v) {
    return v
        .toStringAsFixed(6)
        .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")
        .replaceAll(RegExp(r"\.$"), "");
  }
}

import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/converter/domain/converter_state.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'converter_provider.g.dart';

@Riverpod(keepAlive: true)
class ConverterNotifier extends _$ConverterNotifier {
  @override
  ConverterState build(ConverterGroup category) => const ConverterState();

  void updateValue(String unitId, String value, List<UnitDefinition> allUnits) {
    if (value.isEmpty) {
      state = state.copyWith(values: {});
      return;
    }

    final inputValue = AppNumberFormatter.tryParse(value);
    if (inputValue == null) return;

    final Map<String, String> newValues = {};

    if (category == ConverterGroup.temperature) {
      _handleTemperature(inputValue, unitId, value, allUnits, newValues);
    } else {
      _handleLinear(inputValue, unitId, value, allUnits, newValues);
    }

    state = state.copyWith(values: newValues);
  }

  void _handleTemperature(
    double val,
    String uid,
    String orig,
    List<UnitDefinition> units,
    Map<String, String> out,
  ) {
    double celsius;
    switch (uid) {
      case 'fahrenheit':
        celsius = (val - 32) / 1.8;
        break;
      case 'kelvin':
        celsius = val - 273.15;
        break;
      default:
        celsius = val;
    }

    for (final u in units) {
      if (u.id == uid) {
        out[u.id] = orig;
      } else {
        double conv;
        switch (u.id) {
          case 'fahrenheit':
            conv = (celsius * 1.8) + 32;
            break;
          case 'kelvin':
            conv = celsius + 273.15;
            break;
          default:
            conv = celsius;
        }
        out[u.id] = AppNumberFormatter.format(conv);
      }
    }
  }

  void _handleLinear(
    double val,
    String uid,
    String orig,
    List<UnitDefinition> units,
    Map<String, String> out,
  ) {
    final current = units.firstWhere((u) => u.id == uid);
    final base = val * current.ratio;

    for (final u in units) {
      out[u.id] = u.id == uid
          ? orig
          : AppNumberFormatter.format(base / u.ratio);
    }
  }
}

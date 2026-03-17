// lib/features/converter/data/units_repository.dart
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';

final List<UnitDefinition> lengthUnits = [
  UnitDefinition(id: 'm', label: LocaleKeys.converter_units_m, symbol: 'm', ratio: 1.0),
  UnitDefinition(id: 'mm', label: LocaleKeys.converter_units_mm, symbol: 'mm', ratio: 0.001),
  UnitDefinition(id: 'um', label: LocaleKeys.converter_units_um, symbol: 'µm', ratio: 0.000001),
  UnitDefinition(id: 'km', label: LocaleKeys.converter_units_km, symbol: 'km', ratio: 1000.0),
  UnitDefinition(id: 'inch', label: LocaleKeys.converter_units_inch, symbol: 'in', ratio: 0.0254),
];

final List<UnitDefinition> tempUnits = [
  UnitDefinition(id: 'celsius', label: LocaleKeys.converter_units_celsius, symbol: '°C', ratio: 1.0),
  UnitDefinition(id: 'fahrenheit', label: LocaleKeys.converter_units_fahrenheit, symbol: '°F', ratio: 1.0),
  UnitDefinition(id: 'kelvin', label: LocaleKeys.converter_units_kelvin, symbol: 'K', ratio: 1.0),
];

final List<UnitDefinition> speedUnits = [
  UnitDefinition(id: 'm_s', label: LocaleKeys.converter_units_m_s, symbol: 'm/s', ratio: 1.0),
  UnitDefinition(id: 'km_h', label: LocaleKeys.converter_units_km_h, symbol: 'km/h', ratio: 1 / 3.6),
  UnitDefinition(id: 'mm_min', label: LocaleKeys.converter_units_mm_min, symbol: 'mm/min', ratio: 0.001 / 60),
  UnitDefinition(id: 'mm_s', label: LocaleKeys.converter_units_mm_s, symbol: 'mm/s', ratio: 0.001),
  UnitDefinition(id: 'in_min', label: LocaleKeys.converter_units_in_min, symbol: 'in/min', ratio: 0.0254 / 60),
];

final List<UnitDefinition> pressureUnits = [
  UnitDefinition(id: 'bar', label: LocaleKeys.converter_units_bar, symbol: 'bar', ratio: 1.0),
  UnitDefinition(id: 'psi', label: LocaleKeys.converter_units_psi, symbol: 'psi', ratio: 0.0689476),
  UnitDefinition(id: 'pa', label: LocaleKeys.converter_units_pa, symbol: 'Pa', ratio: 0.00001),
  UnitDefinition(id: 'mpa', label: LocaleKeys.converter_units_mpa, symbol: 'MPa', ratio: 10.0),
  UnitDefinition(id: 'atm', label: LocaleKeys.converter_units_atm, symbol: 'atm', ratio: 1.01325),
];
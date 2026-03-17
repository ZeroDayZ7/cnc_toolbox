// features/converter/data/units_repository.dart
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';

final lengthUnits = [
  UnitDefinition(id: 'm', label: 'Metr', symbol: 'm', ratio: 1.0),
  UnitDefinition(id: 'mm', label: 'Milimetr', symbol: 'mm', ratio: 0.001),
  UnitDefinition(id: 'um', label: 'Mikrometr', symbol: 'µm', ratio: 0.000001),
  UnitDefinition(id: 'km', label: 'Kilometr', symbol: 'km', ratio: 1000.0),
  UnitDefinition(id: 'inch', label: 'Cal', symbol: 'in', ratio: 0.0254),
];

final tempUnits = [
  UnitDefinition(id: 'celsius', label: 'Celsjusz', symbol: '°C', ratio: 1.0),
  UnitDefinition(id: 'fahrenheit', label: 'Fahrenheit', symbol: '°F', ratio: 1.0),
  UnitDefinition(id: 'kelvin', label: 'Kelvin', symbol: 'K', ratio: 1.0),
];

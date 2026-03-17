// features/converter/domain/unit_model.dart
class UnitDefinition {
  final String id;
  final String label;
  final String symbol;
  final double ratio;

  const UnitDefinition({
    required this.id,
    required this.label,
    required this.symbol,
    required this.ratio,
  });
}

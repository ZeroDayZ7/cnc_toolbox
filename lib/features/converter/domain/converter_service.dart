import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';

import '../models/unit_model.dart';

/// Domain service responsible for the mathematical logic of unit conversion.
///
/// It implements a "Hub-and-Spoke" model, where any input unit is first
/// converted to a universal base unit (the Hub) before being distributed
/// to all other supported units (the Spokes).
class ConverterService {
  /// Performs cross-unit calculations for an entire category.
  ///
  /// [sourceUnitId] - The ID of the unit the user is currently typing in.
  /// [inputValue] - The raw string from the UI to preserve user formatting (like trailing dots).
  /// [numericValue] - The pre-parsed double used for calculations.
  /// [allUnits] - The list of [UnitDefinition] available for this specific category.
  ///
  /// Returns a [Result] containing a map where keys are unit IDs and values are localized,
  /// formatted strings, or a [Failure] if the calculation fails.
  static Result<Map<String, String>> calculateValues({
    required String sourceUnitId,
    required String inputValue,
    required double numericValue,
    required List<UnitDefinition> allUnits,
  }) {
    try {
      // 1. Identify the source unit to determine the transformation logic
      // This could throw StateError if the unit is not found.
      final sourceUnit = allUnits.firstWhere((u) => u.id == sourceUnitId);

      // 2. Normalize the input to the internal base unit (e.g., all lengths to Meters)
      final baseValue = sourceUnit.toBase(numericValue);

      final Map<String, String> newValues = {};

      // 3. Project the base value onto all other available units in the category
      for (final unit in allUnits) {
        if (unit.id == sourceUnitId) {
          // Keep the original input string to avoid jumping cursor or losing decimal dots
          newValues[unit.id] = inputValue;
        } else {
          // Convert from base and format for the UI
          final converted = unit.fromBase(baseValue);
          newValues[unit.id] = AppNumberFormatter.format(converted);
        }
      }

      return Success(newValues);
    } catch (e, st) {
      // Wrap any unexpected domain or logic error into a Failure Result.
      return Failure(e, st);
    }
  }
}

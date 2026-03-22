import 'package:intl/intl.dart';

/// A utility class for handling locale-aware number formatting and parsing.
///
/// This class ensures that user input (using either dots or commas as decimal separators)
/// is correctly interpreted based on the current system locale, preventing
/// calculation errors in CNC parameter inputs.
class AppNumberFormatter {
  static String get _currentLocale => Intl.getCurrentLocale();

  /// Attempts to parse a string into a [double], handling various decimal formats.
  ///
  /// The parsing strategy follows a multi-step fallback approach:
  /// 1. Standard [double.tryParse].
  /// 2. Normalization by replacing commas with dots.
  /// 3. Locale-specific parsing via [NumberFormat].
  ///
  /// Returns `null` if the string is empty or cannot be parsed as a valid number.
  static double? tryParse(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;

    // Fast path: standard dart parsing
    final standard = double.tryParse(trimmed);
    if (standard != null) return standard;

    // Fallback: manual normalization for mixed input styles
    final normalized = trimmed.replaceAll(',', '.');
    final standardNormalized = double.tryParse(normalized);
    if (standardNormalized != null) return standardNormalized;

    // Last resort: parse using the current application locale settings
    try {
      final formatter = NumberFormat.decimalPattern(_currentLocale);
      return formatter.parse(trimmed).toDouble();
    } catch (_) {
      // Catching all exceptions to ensure 'tryParse' contract:
      // always return null on failure instead of throwing.
      return null;
    }
  }

  /// Formats a [double] into a localized string representation.
  ///
  /// Automatically strips trailing zeros and respects the [maxDecimal] precision.
  /// Used for displaying calculation results in the UI.
  static String format(double value, {int maxDecimal = 6}) {
    final f = NumberFormat.decimalPattern(_currentLocale)
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = maxDecimal;
    return f.format(value);
  }
}

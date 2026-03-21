import 'package:intl/intl.dart';

class AppNumberFormatter {
  static String get _currentLocale => Intl.getCurrentLocale();

  static double? tryParse(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;

    final standard = double.tryParse(trimmed);
    if (standard != null) return standard;

    final normalized = trimmed.replaceAll(',', '.');
    final standardNormalized = double.tryParse(normalized);
    if (standardNormalized != null) return standardNormalized;

    try {
      final formatter = NumberFormat.decimalPattern(_currentLocale);
      return formatter.parse(trimmed).toDouble();
    } on FormatException {
      return null;
    } catch (e) {
      rethrow;
    }
  }

  static String format(double value, {int maxDecimal = 6}) {
    final f = NumberFormat.decimalPattern(_currentLocale)
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = maxDecimal;
    return f.format(value);
  }
}

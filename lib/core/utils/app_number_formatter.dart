import 'package:intl/intl.dart';

class AppNumberFormatter {
  static String get _currentLocale => Intl.getCurrentLocale();

  static NumberFormat get _decimalFormatter =>
      NumberFormat.decimalPattern(_currentLocale);

  static double? tryParse(String value) {
    if (value.isEmpty) return null;

    // Próba kropki (standard)
    final standard = double.tryParse(value);
    if (standard != null) return standard;

    try {
      return _decimalFormatter.parse(value).toDouble();
    } catch (_) {
      return double.tryParse(value.replaceAll(',', '.'));
    }
  }

  static String format(double value, {int maxDecimal = 6}) {
    final f = NumberFormat.decimalPattern(_currentLocale)
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = maxDecimal;
    return f.format(value);
  }
}

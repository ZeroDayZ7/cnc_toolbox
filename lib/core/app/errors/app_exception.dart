import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

/// Bazowa klasa dla wszystkich błędów aplikacji
abstract class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, [this.code]);

  @override
  String toString() => message;

  /// Metoda do pobierania zlokalizowanego komunikatu dla UI
  String toLocalizedString();
}

/// Błąd inicjalizacji bazy danych
class DatabaseException extends AppException {
  DatabaseException(super.message, [super.code]);

  @override
  String toLocalizedString() => LocaleKeys.error_database_init.tr();
}

/// Błąd ładowania zasobów (np. brak pliku JSON z G-kodami)
class AssetLoadException extends AppException {
  AssetLoadException(super.message);

  @override
  String toLocalizedString() => LocaleKeys.error_assets_missing.tr();
}

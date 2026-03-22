import 'dart:async';

import 'package:cnc_toolbox/core/app/app_observer.dart';
import 'package:cnc_toolbox/core/shared_prefs_provider.dart';
import 'package:cnc_toolbox/core/utils/logger/app_logger.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global logger instance for pre-bootstrap events.
final _logger = AppLogger();

/// Entry point for the application bootstrap process.
///
/// Responsibilities:
/// - Error handling (Flutter errors, asynchronous errors via [PlatformDispatcher]).
/// - Global services initialization (SharedPreferences, Localization).
/// - Manual [ProviderContainer] creation for precise dependency overrides.
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure Flutter bindings are initialized early for platform-specific services
  WidgetsFlutterBinding.ensureInitialized();

  // Catch Flutter-specific framework errors
  FlutterError.onError = _handleFlutterError;

  // Catch errors that happen in the platform's underlying code
  // This modern approach replaces the legacy runZonedGuarded for async errors
  PlatformDispatcher.instance.onError = (error, stack) {
    _handleGlobalError(error, stack);
    return true;
  };

  // Custom UI for unexpected Red Screen of Death in production
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Text(
          kDebugMode
              ? details.exception.toString()
              : 'An unexpected error occurred ⚙️',
          textAlign: TextAlign.center,
        ),
      ),
    );
  };

  await EasyLocalization.ensureInitialized();

  // 1. Core services initialization before Riverpod starts
  final prefs = await SharedPreferences.getInstance();

  // 2. Create ProviderContainer with manual overrides
  // Using UncontrolledProviderScope allows us to manage the lifecycle
  // of the container manually, which is safer for advanced bootstrap flows.
  final container = ProviderContainer(
    observers: [const AppObserver()],
    overrides: [
      sharedPrefsProvider.overrideWithValue(prefs),
      appLoggerProvider.overrideWithValue(_logger),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: EasyLocalization(
        supportedLocales: const [Locale('pl'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        child: await builder(),
      ),
    ),
  );
}

/// Logs errors that occur outside of the Flutter framework context.
void _handleGlobalError(Object error, StackTrace stack) =>
    _logger.e('🔥 Global Error', error: error, stackTrace: stack);

/// Logs errors captured by the Flutter framework.
void _handleFlutterError(FlutterErrorDetails details) => _logger.e(
  '💥 Flutter Error',
  error: details.exception,
  stackTrace: details.stack,
);

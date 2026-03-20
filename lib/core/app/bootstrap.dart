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

final _logger = AppLogger();

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = _handleFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    _handleGlobalError(error, stack);
    return true;
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Text(
          kDebugMode
              ? details.exception.toString()
              : 'Wystąpił nieoczekiwany błąd ⚙️',
          textAlign: TextAlign.center,
        ),
      ),
    );
  };

  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    // 1. Inicjalizacja usług przed startem Riverpoda
    final prefs = await SharedPreferences.getInstance();

    // 2. Ręczne tworzenie ProviderContainer
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
  }, (error, stack) => _handleGlobalError(error, stack));
}

void _handleGlobalError(Object error, StackTrace stack) =>
    _logger.e('🔥 Global Error', error: error, stackTrace: stack);

void _handleFlutterError(FlutterErrorDetails details) => _logger.e(
  '💥 Flutter Error',
  error: details.exception,
  stackTrace: details.stack,
);

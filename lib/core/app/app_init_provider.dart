import 'package:cnc_toolbox/core/app/app_init_status.dart';
import 'package:cnc_toolbox/core/database/drift_database_repository.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/theme/theme_provider.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_init_provider.g.dart';

@riverpod
class AppInitNotifier extends _$AppInitNotifier {
  @override
  AppInitStatus build() =>
      const AppInitStatus.loading(messageKey: LocaleKeys.splash_initializing);

  Future<void> initialize() async => await _runBootstrap();

  Future<void> _runBootstrap() async {
    final logger = ref.read(appLoggerProvider);
    final startTime = DateTime.now();

    try {
      // if (DateTime.now().isAfter(DateTime(2024))) {
      //   throw Exception("Test błędu");
      // }
      // 1. Ładowanie Bazy
      state = const AppInitStatus.loading(
        messageKey: LocaleKeys.splash_database_init,
      );
      final dbRepo = ref.read(databaseRepositoryProvider);
      final result = await dbRepo.healthCheck();

      switch (result) {
        case Success(data: final isHealthy):
          if (!isHealthy) {
            state = const AppInitStatus.blocked(
              reason: 'Database health check returned false',
            );
            return;
          }
          logger.i('Database connection: OK');

        case Failure(error: final e):
          logger.e('Database bootstrap failed', error: e);
          state = AppInitStatus.blocked(reason: e.toString());
          return;
      }

      // 2. Ładowanie Ustawień
      state = const AppInitStatus.loading(
        messageKey: LocaleKeys.splash_settings_load,
      );
      ref.read(themeProvider);
      ref.read(localeProvider);

      // 3. Minimum Splash Time
      final elapsed = DateTime.now().difference(startTime);
      const minSplashTime = Duration(milliseconds: 1500);
      if (elapsed < minSplashTime) {
        await Future.delayed(minSplashTime - elapsed);
      }

      state = const AppInitStatus.ready();
    } catch (e, st) {
      logger.e('💥 Bootstrap failed', error: e, stackTrace: st);
      state = AppInitStatus.blocked(reason: e.toString());
    }
  }

  Future<void> recheck() async {
    state = const AppInitStatus.loading(messageKey: 'splash.initializing');
    await _runBootstrap();
  }
}

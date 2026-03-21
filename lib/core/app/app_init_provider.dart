import 'package:cnc_toolbox/core/app/errors/app_exception.dart';
import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/database/drift_database_repository.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/theme/theme_provider.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/converter/application/converter_settings_provider.dart';
import 'package:cnc_toolbox/features/g_codes/application/g_codes_controller.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_init_provider.g.dart';

@riverpod
Future<void> appInit(Ref ref) async {
  final logger = ref.read(appLoggerProvider);
  final startTime = DateTime.now();

  try {
    // 1. Database Health Check
    final dbRepo = ref.read(databaseRepositoryProvider);
    final dbResult = await dbRepo.healthCheck();

    if (dbResult is Failure<bool>) {
      throw DatabaseException('Drift Failure: ${dbResult.error}');
    }

    if (dbResult is Success<bool> && !dbResult.data) {
      throw DatabaseException('Database unhealthy');
    }

    // 2. Warm-up Providers
    ref.read(themeProvider);
    ref.read(localeProvider);
    ref.read(gCodeControllerProvider);
    ref.read(settingsProvider);

    // Czekamy na asynchroniczne
    await Future.wait([
      ref.read(toleranceServiceProvider.future),
      ref.read(historyProvider.future),
    ]);

    // 3. Minimum Splash Time
    final elapsed = DateTime.now().difference(startTime);
    if (elapsed < AppConfig.minSplashDuration) {
      await Future.delayed(AppConfig.minSplashDuration - elapsed);
    }

    logger.i('🚀 App Bootstrap Completed Successfully');
  } catch (e, st) {
    logger.e('💥 App Bootstrap Failed', error: e, stackTrace: st);
    rethrow;
  }
}

import 'package:cnc_toolbox/core/app/app_init_status.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_init_provider.g.dart';

@riverpod
class AppInitNotifier extends _$AppInitNotifier {
  @override
  AppInitStatus build() => const AppInitStatus.loading();

  Future<void> initialize() async => await _runBootstrap();

  Future<void> _runBootstrap() async {
    final logger = ref.read(appLoggerProvider);

    final startTime = DateTime.now();

    try {
      await Future.delayed(const Duration(seconds: 2));
      // W wersji offline nie potrzebujemy skomplikowanego StartupRunnera,
      // chyba że planujesz bardzo dużo zadań. Robimy to sekwencyjnie:

      // 1. Inicjalizacja bazy danych (np. Drift)
      // await ref.read(appDatabaseProvider).executor.ensureOpen(ref.read(appDatabaseProvider));

      // 2. Ewentualne ładowanie ustawień użytkownika z SharedPreferences
      // await ref.read(settingsProvider.notifier).load();

      final elapsed = DateTime.now().difference(startTime);
      const minSplashTime = Duration(milliseconds: 1500);

      // 3. Jeśli poszło za szybko (np. w Release), czekamy resztę czasu
      if (elapsed < minSplashTime) {
        await Future.delayed(minSplashTime - elapsed);
      }

      // Jeśli wszystko ok:
      state = const AppInitStatus.ready();
    } catch (e, st) {
      logger.e('💥 Bootstrap failed', error: e, stackTrace: st);
      state = AppInitStatus.blocked(reason: e.toString());
    }
  }

  Future<void> recheck() async {
    state = const AppInitStatus.loading();
    await _runBootstrap();
  }
}

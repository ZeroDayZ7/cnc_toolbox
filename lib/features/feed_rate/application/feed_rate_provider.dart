import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/utils/logger/app_logger.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_provider.g.dart';

@riverpod
class FeedRateNotifier extends _$FeedRateNotifier {
  @override
  FeedRateState build(String type) => const FeedRateState();

  AppLogger get _log => ref.read(appLoggerProvider);

  // --- ZAPIS I ODCZYT Z BAZY ---

  Future<void> saveCurrentToDb() async {
    // Sprawdź czy stan w ogóle istnieje
    if (state.resultVf <= 0) {
      _log.w("Anulowano zapis: wynik Vf jest zerowy", module: "FEED_RATE");
      return;
    }

    final db = ref.read(databaseProvider);

    try {
      await db.saveFeedCalculation(
        n: state.spindleSpeed,
        fz: state.feedPerTooth,
        z: state.numberOfTeeth,
        vf: state.resultVf,
        d: state.toolDiameter > 0 ? state.toolDiameter : null,
        dWork: state.featureDiameter > 0 ? state.featureDiameter : null,
      );
      _log.i("Pomyślnie zapisano obliczenia do bazy", module: "FEED_RATE");
    } catch (e, st) {
      _log.e(
        "Błąd podczas zapisu do bazy",
        module: "DATABASE",
        error: e,
        stackTrace: st,
      );
    }
  }

  // Metoda do wczytywania danych z historii z powrotem do UI
  void loadFromHistory(FeedCalculation entry) {
    _log.d("Wczytywanie historii ID: ${entry.id}", module: "FEED_RATE");
    state = state.copyWith(
      spindleSpeed: entry.spindleSpeed,
      feedPerTooth: entry.feedPerTooth,
      numberOfTeeth: entry.teeth,
      toolDiameter: entry.toolDiameter ?? 0,
      featureDiameter: entry.featureDiameter ?? 0,
    );
    _calculate();
  }

  // Aktualizacja danych
  void updateSpindleSpeed(String v) => _update(
    () => state = state.copyWith(spindleSpeed: double.tryParse(v) ?? 0),
  );
  void updateFeedPerTooth(String v) => _update(
    () => state = state.copyWith(feedPerTooth: double.tryParse(v) ?? 0),
  );
  void updateTeeth(int v) =>
      _update(() => state = state.copyWith(numberOfTeeth: v));
  void updateToolDia(String v) => _update(
    () => state = state.copyWith(toolDiameter: double.tryParse(v) ?? 0),
  );
  void updateFeatureDia(String v) => _update(
    () => state = state.copyWith(featureDiameter: double.tryParse(v) ?? 0),
  );
  void toggleWorkType(bool isInternal) =>
      _update(() => state = state.copyWith(isInternal: isInternal));

  void _update(Function action) {
    action();
    _calculate();
  }

  void _calculate() {
    // 1. Podstawowy Vf
    final vf = state.spindleSpeed * state.feedPerTooth * state.numberOfTeeth;
    final f = state.feedPerTooth * state.numberOfTeeth;

    // 2. Kompensacja łuku
    double vfArc = vf;
    if (state.toolDiameter > 0 && state.featureDiameter > 0) {
      if (state.isInternal) {
        // Otwór: wolniej
        vfArc =
            vf *
            (state.featureDiameter - state.toolDiameter) /
            state.featureDiameter;
      } else {
        // Czop: szybciej
        vfArc =
            vf *
            (state.featureDiameter + state.toolDiameter) /
            state.featureDiameter;
      }
    }

    state = state.copyWith(
      resultVf: vf,
      resultVfArc: vfArc < 0 ? 0 : vfArc,
      resultF: f,
    );
  }
}

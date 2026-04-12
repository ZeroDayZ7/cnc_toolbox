import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_computed.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/data/history_repository_provider.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedRateNotifier extends _$FeedRateNotifier {
  @override
  FeedRateState build(FeedType type) => const FeedRateState();

  // --- Akcje Biznesowe ---

  Future<void> save() async {
    final log = ref.read(appLoggerProvider);
    final repo = ref.read(historyRepositoryProvider);
    final vf = ref.read(feedRateVfProvider(type));
    final avf = ref.read(adjustedFeedRateProvider(type));

    if (vf <= 0) return;

    final finalVf = type == FeedType.arc ? avf : vf;

    final result = await repo.saveFeedCalculation(
      n: state.spindleSpeed,
      fz: state.feedPerTooth,
      z: state.numberOfTeeth,
      vf: finalVf,
      d: state.toolDiameter > 0 ? state.toolDiameter : null,
      dWork: state.featureDiameter > 0 ? state.featureDiameter : null,
    );

    switch (result) {
      case Success():
        log.i("Saved calculation to history", module: "FEED_RATE");
        ref.read(historyProvider.notifier).refreshHistory();

      case Failure(error: final e):
        log.e("Save to history failed", module: "DATABASE", error: e);
    }
  }

  // --- Metody Aktualizacji Stanu ---

  void loadFromHistory(FeedHistoryItem entry) {
    state = state.copyWith(
      spindleSpeed: entry.n,
      feedPerTooth: entry.fz,
      numberOfTeeth: entry.z,
      toolDiameter: 0,
      featureDiameter: 0,
    );
  }

  void updateSpindleSpeed(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(spindleSpeed: val);
  }

  void updateFeedPerTooth(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(feedPerTooth: val);
  }

  void updateTeeth(String rawValue) {
    final val = int.tryParse(rawValue);
    if (val != null) state = state.copyWith(numberOfTeeth: val);
  }

  void updateToolDia(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(toolDiameter: val);
  }

  void updateFeatureDia(String rawValue) {
    final val = AppNumberFormatter.tryParse(rawValue);
    if (val != null) state = state.copyWith(featureDiameter: val);
  }

  void toggleWorkType(bool isInternal) =>
      state = state.copyWith(isInternal: isInternal);
}

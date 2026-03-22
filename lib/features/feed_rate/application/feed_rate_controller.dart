import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_computed.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/data/feed_rate_repository.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_calculation_dto.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_controller.g.dart';

@Riverpod(keepAlive: true)
class FeedRateController extends _$FeedRateController {
  @override
  void build() {}

  Future<void> save(FeedType type) async {
    final log = ref.read(appLoggerProvider);
    final repo = ref.read(feedRateRepositoryProvider);

    final s = ref.read(feedRateProvider(type));
    final vf = ref.read(feedRateVfProvider(type));
    final avf = ref.read(adjustedFeedRateProvider(type));

    if (vf <= 0) return;

    final dto = FeedCalculationDto(
      vf: vf,
      adjustedVf: avf,
      fz: s.feedPerTooth,
      z: s.numberOfTeeth,
      n: s.spindleSpeed,
      toolDiameter: s.toolDiameter,
      featureDiameter: s.featureDiameter,
      isInternal: s.isInternal,
    );

    final result = await repo.saveCalculationDto(dto);

    // Używamy pattern matching do obsługi wyniku
    switch (result) {
      case Success():
        log.i("Saved calculation", module: "FEED_RATE");
      case Failure(error: final e):
        log.e("Save failed", module: "DATABASE", error: e);
    }
  }
}

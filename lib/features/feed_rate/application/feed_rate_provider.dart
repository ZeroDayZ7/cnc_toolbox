import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedRateNotifier extends _$FeedRateNotifier {
  @override
  FeedRateState build(FeedType type) => const FeedRateState();

  void loadFromHistory(FeedHistoryItem entry) {
    state = state.copyWith(
      spindleSpeed: entry.n,
      feedPerTooth: entry.fz,
      numberOfTeeth: entry.z,
      toolDiameter: 0,
      featureDiameter: 0,
    );
  }

  void updateSpindleSpeed(double val) =>
      state = state.copyWith(spindleSpeed: val);
  void updateFeedPerTooth(double val) =>
      state = state.copyWith(feedPerTooth: val);
  void updateToolDia(double val) => state = state.copyWith(toolDiameter: val);
  void updateFeatureDia(double val) =>
      state = state.copyWith(featureDiameter: val);
  void updateTeeth(int val) => state = state.copyWith(numberOfTeeth: val);
  void toggleWorkType(bool isInternal) =>
      state = state.copyWith(isInternal: isInternal);
}

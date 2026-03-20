import 'dart:async';

import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_notifier.g.dart';

@Riverpod(keepAlive: true)
class HistoryNotifier extends _$HistoryNotifier {
  @override
  FutureOr<List<FeedHistoryItem>> build() async {
    return _fetchAndMapHistory();
  }

  Future<List<FeedHistoryItem>> _fetchAndMapHistory() async {
    final db = ref.read(databaseProvider);

    // Pobieramy surowe dane z Drifta
    final driftData = await db.getFeedHistory();

    // Mapujemy na nasz czysty model DTO
    return driftData
        .map(
          (e) => FeedHistoryItem(
            vf: e.resultVf,
            n: e.spindleSpeed,
            fz: e.feedPerTooth,
            z: e.teeth,
            createdAt: e.createdAt,
            toolDiameter: e.toolDiameter ?? 0.0, 
          ),
        )
        .toList();
  }

  Future<void> refreshHistory() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchAndMapHistory());
  }
}

// i_history_repository.dart
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';

abstract class IHistoryRepository {
  Future<Result<List<FeedHistoryItem>>> getFeedHistory({
    int limit = 10,
    int offset = 0,
  });

  Future<Result<void>> saveFeedCalculation({
    required double n,
    required double fz,
    required int z,
    required double vf,
    double? d,
    double? dWork,
  });

  Future<Result<void>> deleteEntry(int id);

  Future<Result<void>> clearAllHistory();
}

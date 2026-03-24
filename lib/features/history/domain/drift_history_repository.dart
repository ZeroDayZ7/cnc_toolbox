import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:cnc_toolbox/features/history/domain/i_history_repository.dart';

class DriftHistoryRepository implements IHistoryRepository {
  final AppDatabase _db;
  DriftHistoryRepository(this._db);

  @override
  Future<Result<List<FeedHistoryItem>>> getFeedHistory({
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final rows = await _db.driftFeedRateDao.getAllHistory(
        limit: limit,
        offset: offset,
      );
      return Success(rows.map((row) => row.toDomain()).toList());
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  Future<Result<void>> saveFeedCalculation({
    required double n,
    required double fz,
    required int z,
    required double vf,
    double? d,
    double? dWork,
  }) async {
    try {
      await _db.driftFeedRateDao.insertCalculation(
        n: n,
        fz: fz,
        z: z,
        vf: vf,
        d: d,
        dWork: dWork,
      );
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  Future<Result<void>> deleteEntry(int id) async {
    try {
      await _db.driftFeedRateDao.deleteById(id);
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  Future<Result<void>> clearAllHistory() async {
    try {
      await _db.transaction(() async {
        await _db.delete(_db.feedCalculations).go();
      });
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }
}

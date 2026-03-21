import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/features/history/domain/i_history_repository.dart';
import 'package:cnc_toolbox/features/history/models/feed_history_entry.dart';

class DriftHistoryRepository implements IHistoryRepository {
  final AppDatabase _db;
  DriftHistoryRepository(this._db);

  @override
  Future<List<FeedHistoryEntry>> getFeedHistory({
    int limit = 10,
    int offset = 0,
  }) async {
    final rows = await _db.getFeedHistory(limit: limit, offset: offset);
    return rows.map((row) => row.toDomain()).toList();
  }

  @override
  Future<void> saveCalculation({
    required double n,
    required double fz,
    required int z,
    required double vf,
    double? d,
    double? dWork,
  }) async {
    await _db.saveFeedCalculation(
      n: n,
      fz: fz,
      z: z,
      vf: vf,
      d: d,
      dWork: dWork,
    );
  }

  @override
  Future<void> deleteEntry(int id) async {
    await _db.deleteFeedEntry(id);
  }
}

extension on FeedCalculation {
  FeedHistoryEntry toDomain() {
    return FeedHistoryEntry(
      id: id,
      spindleSpeed: spindleSpeed,
      feedPerTooth: feedPerTooth,
      teeth: teeth,
      resultVf: resultVf,
      toolDiameter: toolDiameter,
      featureDiameter: featureDiameter,
      createdAt: createdAt,
    );
  }
}

import 'package:cnc_toolbox/core/database/daos/feed_rate_dao.dart';
import 'package:cnc_toolbox/core/database/database.dart';
import 'package:drift/drift.dart';

part 'drift_feed_rate_dao.g.dart';

@DriftAccessor(tables: [FeedCalculations])
class DriftFeedRateDao extends DatabaseAccessor<AppDatabase>
    with _$DriftFeedRateDaoMixin
    implements FeedRateDao {
  DriftFeedRateDao(super.db);

  @override
  Future<void> insertCalculation({
    required double n,
    required double fz,
    required int z,
    required double vf,
    double? d,
    double? dWork,
  }) {
    return into(feedCalculations).insert(
      FeedCalculationsCompanion.insert(
        spindleSpeed: n,
        feedPerTooth: fz,
        teeth: z,
        resultVf: vf,
        toolDiameter: Value(d),
        featureDiameter: Value(dWork),
      ),
    );
  }

  @override
  Future<List<FeedCalculation>> getAllHistory({
    int limit = 10,
    int offset = 0,
  }) {
    return (select(feedCalculations)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  @override
  Future<void> deleteById(int id) {
    return (delete(feedCalculations)..where((t) => t.id.equals(id))).go();
  }
}

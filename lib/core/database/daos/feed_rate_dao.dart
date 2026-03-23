// lib/core/database/daos/feed_rate_dao.dart
import 'package:cnc_toolbox/core/database/database.dart';

abstract class FeedRateDao {
  Future<void> insertCalculation({
    required double n,
    required double fz,
    required int z,
    required double vf,
    double? d,
    double? dWork,
  });

  Future<List<FeedCalculation>> getAllHistory({int limit, int offset});
  Future<void> deleteById(int id);
}

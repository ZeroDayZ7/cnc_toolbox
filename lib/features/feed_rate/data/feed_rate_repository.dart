import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_calculation_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_rate_repository.g.dart';

abstract class IFeedRateRepository {
  Future<Result<void>> saveCalculationDto(FeedCalculationDto dto);
  Future<Result<List<FeedCalculation>>> getHistory({
    int limit = 10,
    int offset = 0,
  });
  Future<Result<void>> deleteEntry(int id);
}

class FeedRateRepository implements IFeedRateRepository {
  final AppDatabase _db;
  FeedRateRepository(this._db);

  @override
  Future<Result<void>> saveCalculationDto(FeedCalculationDto dto) async {
    try {
      await _db.saveFeedCalculation(
        n: dto.n,
        fz: dto.fz,
        z: dto.z,
        vf: dto.vf,
        d: dto.toolDiameter > 0 ? dto.toolDiameter : null,
        dWork: dto.featureDiameter > 0 ? dto.featureDiameter : null,
      );
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  Future<Result<List<FeedCalculation>>> getHistory({
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final history = await _db.getFeedHistory(limit: limit, offset: offset);
      return Success(history);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  Future<Result<void>> deleteEntry(int id) async {
    try {
      await _db.deleteFeedEntry(id);
      return const Success(null);
    } catch (e, st) {
      return Failure(e, st);
    }
  }
}

@Riverpod(keepAlive: true)
IFeedRateRepository feedRateRepository(Ref ref) {
  return FeedRateRepository(ref.watch(databaseProvider));
}

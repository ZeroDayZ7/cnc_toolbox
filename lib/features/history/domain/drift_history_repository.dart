import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/history/domain/i_history_repository.dart';
import 'package:drift/drift.dart';

class DriftHistoryRepository implements IHistoryRepository {
  final AppDatabase _db;

  DriftHistoryRepository(this._db);

  @override
  Future<Result<List<FeedCalculation>>> getFeedHistory() async {
    try {
      final query = _db.select(_db.feedCalculations)
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

      final data = await query.get();
      return Success(data);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  Future<Result<bool>> addToHistory(FeedCalculationsCompanion entry) async {
    try {
      await _db.into(_db.feedCalculations).insert(entry);
      return const Success(true);
    } catch (e, st) {
      return Failure(e, st);
    }
  }
}

import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/database/i_database_repository.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drift_database_repository.g.dart';

class DriftDatabaseRepository implements IDatabaseRepository {
  final AppDatabase _db;

  DriftDatabaseRepository(this._db);

  @override
  Future<Result<bool>> healthCheck() async {
    try {
      final result = await _db.customSelect('SELECT 1').getSingle();
      return Success(result.data.isNotEmpty);
    } catch (e, st) {
      return Failure(e, st);
    }
  }

  @override
  Future<void> close() => _db.close();
}

@riverpod
IDatabaseRepository databaseRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return DriftDatabaseRepository(db);
}

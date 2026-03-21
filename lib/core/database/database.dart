import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

class FeedCalculations extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get spindleSpeed => real()();
  RealColumn get feedPerTooth => real()();
  IntColumn get teeth => integer()();
  RealColumn get toolDiameter => real().nullable()();
  RealColumn get featureDiameter => real().nullable()();
  RealColumn get resultVf => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class SearchResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text()();
  TextColumn get resultJson => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [SearchResults, FeedCalculations])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  Future<int> saveFeedCalculation({
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

  Future<List<FeedCalculation>> getFeedHistory({
    int limit = 10,
    int offset = 0,
  }) {
    return (select(feedCalculations)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(limit, offset: offset))
        .get();
  }

  Future<int> deleteFeedEntry(int id) {
    return (delete(feedCalculations)..where((t) => t.id.equals(id))).go();
  }

  Future<int> saveSearchResult(String query, String json) {
    return into(
      searchResults,
    ).insert(SearchResultsCompanion.insert(query: query, resultJson: json));
  }
}

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  final db = AppDatabase(driftDatabase(name: AppConfig.dbName));
  ref.onDispose(() => db.close());
  return db;
}

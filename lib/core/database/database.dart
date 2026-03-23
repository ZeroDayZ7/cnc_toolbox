import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/database/daos/drift_feed_rate_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

/// Table for persisting CNC feed rate calculation history.
///
/// Stores input parameters like [spindleSpeed] and [feedPerTooth]
/// along with the calculated [resultVf].
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

/// Table for caching search results to improve performance and provide offline access.
class SearchResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text()();
  TextColumn get resultJson => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// The main local database class using Drift for SQL persistence.
@DriftDatabase(
  tables: [SearchResults, FeedCalculations],
  daos: [DriftFeedRateDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  /// Saves a search query and its corresponding JSON result for later retrieval.
  Future<int> saveSearchResult(String query, String json) {
    return into(
      searchResults,
    ).insert(SearchResultsCompanion.insert(query: query, resultJson: json));
  }
}

/// Provider for the [AppDatabase] instance.
///
/// Uses [keepAlive] to ensure the database connection remains open
/// throughout the application lifecycle.
@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  final db = AppDatabase(driftDatabase(name: AppConfig.dbName));
  ref.onDispose(() => db.close());
  return db;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_feed_rate_dao.dart';

// ignore_for_file: type=lint
mixin _$DriftFeedRateDaoMixin on DatabaseAccessor<AppDatabase> {
  $FeedCalculationsTable get feedCalculations =>
      attachedDatabase.feedCalculations;
  DriftFeedRateDaoManager get managers => DriftFeedRateDaoManager(this);
}

class DriftFeedRateDaoManager {
  final _$DriftFeedRateDaoMixin _db;
  DriftFeedRateDaoManager(this._db);
  $$FeedCalculationsTableTableManager get feedCalculations =>
      $$FeedCalculationsTableTableManager(
        _db.attachedDatabase,
        _db.feedCalculations,
      );
}

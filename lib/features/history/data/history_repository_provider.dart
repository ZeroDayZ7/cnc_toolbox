import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/features/history/domain/drift_history_repository.dart';
import 'package:cnc_toolbox/features/history/domain/i_history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_repository_provider.g.dart';

@Riverpod(keepAlive: true)
IHistoryRepository historyRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return DriftHistoryRepository(db);
}

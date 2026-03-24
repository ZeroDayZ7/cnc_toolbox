import 'dart:async';

import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/history/data/history_repository_provider.dart';
import 'package:cnc_toolbox/features/history/domain/feed_history_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_notifier.g.dart';

@Riverpod(keepAlive: true)
class HistoryNotifier extends _$HistoryNotifier {
  @override
  FutureOr<List<FeedHistoryItem>> build() async {
    final repo = ref.watch(historyRepositoryProvider);
    final result = await repo.getFeedHistory();

    return switch (result) {
      Success<List<FeedHistoryItem>>(data: final list) => list,
      Failure<List<FeedHistoryItem>>(error: final e, stackTrace: final st) =>
        Error.throwWithStackTrace(e, st ?? StackTrace.current),
    };
  }

  Future<void> deleteItem(int id) async {
    final repo = ref.read(historyRepositoryProvider);
    final result = await repo.deleteEntry(id);

    if (result is Success) {
      final currentList = state.value ?? [];
      final newList = currentList.where((item) => item.id != id).toList();
      state = AsyncData(newList);
    }
  }

  Future<void> clearHistory() async {
    final repo = ref.read(historyRepositoryProvider);
    final result = await repo.clearAllHistory();

    if (result is Success) {
      state = const AsyncData([]);
    }
  }

  Future<void> refreshHistory() async {
    state = const AsyncLoading();
    final repo = ref.read(historyRepositoryProvider);
    final result = await repo.getFeedHistory();

    state = switch (result) {
      Success<List<FeedHistoryItem>>(data: final list) => AsyncData(list),
      Failure<List<FeedHistoryItem>>(error: final e, stackTrace: final st) =>
        AsyncError(e, st ?? StackTrace.current),
    };
  }
}

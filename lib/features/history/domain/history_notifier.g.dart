// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistoryNotifier)
final historyProvider = HistoryNotifierProvider._();

final class HistoryNotifierProvider
    extends $AsyncNotifierProvider<HistoryNotifier, List<FeedHistoryItem>> {
  HistoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyNotifierHash();

  @$internal
  @override
  HistoryNotifier create() => HistoryNotifier();
}

String _$historyNotifierHash() => r'd31da25e81d2cc193366d4918f1950df055cb460';

abstract class _$HistoryNotifier extends $AsyncNotifier<List<FeedHistoryItem>> {
  FutureOr<List<FeedHistoryItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<FeedHistoryItem>>, List<FeedHistoryItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FeedHistoryItem>>,
                List<FeedHistoryItem>
              >,
              AsyncValue<List<FeedHistoryItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

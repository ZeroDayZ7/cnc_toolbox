// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(historyRepository)
final historyRepositoryProvider = HistoryRepositoryProvider._();

final class HistoryRepositoryProvider
    extends
        $FunctionalProvider<
          IHistoryRepository,
          IHistoryRepository,
          IHistoryRepository
        >
    with $Provider<IHistoryRepository> {
  HistoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyRepositoryHash();

  @$internal
  @override
  $ProviderElement<IHistoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IHistoryRepository create(Ref ref) {
    return historyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IHistoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IHistoryRepository>(value),
    );
  }
}

String _$historyRepositoryHash() => r'89bbefe591db23dd019ec2ad3b1ec6672cbebca1';

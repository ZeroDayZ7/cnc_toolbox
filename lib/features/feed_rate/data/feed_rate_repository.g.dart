// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_rate_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(feedRateRepository)
final feedRateRepositoryProvider = FeedRateRepositoryProvider._();

final class FeedRateRepositoryProvider
    extends
        $FunctionalProvider<
          IFeedRateRepository,
          IFeedRateRepository,
          IFeedRateRepository
        >
    with $Provider<IFeedRateRepository> {
  FeedRateRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedRateRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedRateRepositoryHash();

  @$internal
  @override
  $ProviderElement<IFeedRateRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IFeedRateRepository create(Ref ref) {
    return feedRateRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IFeedRateRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IFeedRateRepository>(value),
    );
  }
}

String _$feedRateRepositoryHash() =>
    r'f1136fd64ca844127b015afefab4766893b104b1';

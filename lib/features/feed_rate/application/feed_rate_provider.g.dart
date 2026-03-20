// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_rate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedRateNotifier)
final feedRateProvider = FeedRateNotifierFamily._();

final class FeedRateNotifierProvider
    extends $NotifierProvider<FeedRateNotifier, FeedRateState> {
  FeedRateNotifierProvider._({
    required FeedRateNotifierFamily super.from,
    required FeedType super.argument,
  }) : super(
         retry: null,
         name: r'feedRateProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$feedRateNotifierHash();

  @override
  String toString() {
    return r'feedRateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FeedRateNotifier create() => FeedRateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedRateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedRateState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FeedRateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$feedRateNotifierHash() => r'76d525066619a16b83241f261651887fbe824612';

final class FeedRateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FeedRateNotifier,
          FeedRateState,
          FeedRateState,
          FeedRateState,
          FeedType
        > {
  FeedRateNotifierFamily._()
    : super(
        retry: null,
        name: r'feedRateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FeedRateNotifierProvider call(FeedType type) =>
      FeedRateNotifierProvider._(argument: type, from: this);

  @override
  String toString() => r'feedRateProvider';
}

abstract class _$FeedRateNotifier extends $Notifier<FeedRateState> {
  late final _$args = ref.$arg as FeedType;
  FeedType get type => _$args;

  FeedRateState build(FeedType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FeedRateState, FeedRateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FeedRateState, FeedRateState>,
              FeedRateState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

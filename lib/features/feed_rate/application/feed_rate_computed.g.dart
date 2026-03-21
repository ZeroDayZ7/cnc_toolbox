// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_rate_computed.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(feedRateVf)
final feedRateVfProvider = FeedRateVfFamily._();

final class FeedRateVfProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  FeedRateVfProvider._({
    required FeedRateVfFamily super.from,
    required FeedType super.argument,
  }) : super(
         retry: null,
         name: r'feedRateVfProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$feedRateVfHash();

  @override
  String toString() {
    return r'feedRateVfProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as FeedType;
    return feedRateVf(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FeedRateVfProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$feedRateVfHash() => r'd40d495e87bddc7f7d938b377233e139ddbd904d';

final class FeedRateVfFamily extends $Family
    with $FunctionalFamilyOverride<double, FeedType> {
  FeedRateVfFamily._()
    : super(
        retry: null,
        name: r'feedRateVfProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FeedRateVfProvider call(FeedType type) =>
      FeedRateVfProvider._(argument: type, from: this);

  @override
  String toString() => r'feedRateVfProvider';
}

@ProviderFor(adjustedFeedRate)
final adjustedFeedRateProvider = AdjustedFeedRateFamily._();

final class AdjustedFeedRateProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  AdjustedFeedRateProvider._({
    required AdjustedFeedRateFamily super.from,
    required FeedType super.argument,
  }) : super(
         retry: null,
         name: r'adjustedFeedRateProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$adjustedFeedRateHash();

  @override
  String toString() {
    return r'adjustedFeedRateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as FeedType;
    return adjustedFeedRate(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AdjustedFeedRateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$adjustedFeedRateHash() => r'44aae1ec4c08bb7721170c7e7e7a00cc8d2c8dc8';

final class AdjustedFeedRateFamily extends $Family
    with $FunctionalFamilyOverride<double, FeedType> {
  AdjustedFeedRateFamily._()
    : super(
        retry: null,
        name: r'adjustedFeedRateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AdjustedFeedRateProvider call(FeedType type) =>
      AdjustedFeedRateProvider._(argument: type, from: this);

  @override
  String toString() => r'adjustedFeedRateProvider';
}

@ProviderFor(feedRateF)
final feedRateFProvider = FeedRateFFamily._();

final class FeedRateFProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  FeedRateFProvider._({
    required FeedRateFFamily super.from,
    required FeedType super.argument,
  }) : super(
         retry: null,
         name: r'feedRateFProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$feedRateFHash();

  @override
  String toString() {
    return r'feedRateFProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as FeedType;
    return feedRateF(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FeedRateFProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$feedRateFHash() => r'a67e8d09383e8117d7435a731517e271a07008ca';

final class FeedRateFFamily extends $Family
    with $FunctionalFamilyOverride<double, FeedType> {
  FeedRateFFamily._()
    : super(
        retry: null,
        name: r'feedRateFProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FeedRateFProvider call(FeedType type) =>
      FeedRateFProvider._(argument: type, from: this);

  @override
  String toString() => r'feedRateFProvider';
}

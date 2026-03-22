// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_rate_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedRateController)
final feedRateControllerProvider = FeedRateControllerProvider._();

final class FeedRateControllerProvider
    extends $NotifierProvider<FeedRateController, void> {
  FeedRateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedRateControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedRateControllerHash();

  @$internal
  @override
  FeedRateController create() => FeedRateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$feedRateControllerHash() =>
    r'73d83c195340a0c53098e9ac119f1e8be1156fe4';

abstract class _$FeedRateController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cutting_speed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CuttingSpeedNotifier)
final cuttingSpeedProvider = CuttingSpeedNotifierProvider._();

final class CuttingSpeedNotifierProvider
    extends $NotifierProvider<CuttingSpeedNotifier, CuttingSpeedState> {
  CuttingSpeedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cuttingSpeedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cuttingSpeedNotifierHash();

  @$internal
  @override
  CuttingSpeedNotifier create() => CuttingSpeedNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CuttingSpeedState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CuttingSpeedState>(value),
    );
  }
}

String _$cuttingSpeedNotifierHash() =>
    r'1792209840cd7a6b4cb4d1230f6b608d14b222ba';

abstract class _$CuttingSpeedNotifier extends $Notifier<CuttingSpeedState> {
  CuttingSpeedState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CuttingSpeedState, CuttingSpeedState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CuttingSpeedState, CuttingSpeedState>,
              CuttingSpeedState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

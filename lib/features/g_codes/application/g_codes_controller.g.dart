// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_codes_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GCodeController)
final gCodeControllerProvider = GCodeControllerProvider._();

final class GCodeControllerProvider
    extends $NotifierProvider<GCodeController, GCodeState> {
  GCodeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gCodeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gCodeControllerHash();

  @$internal
  @override
  GCodeController create() => GCodeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GCodeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GCodeState>(value),
    );
  }
}

String _$gCodeControllerHash() => r'9ccd19b7c8807dadb219d076c9ab4eb4dcaf2460';

abstract class _$GCodeController extends $Notifier<GCodeState> {
  GCodeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GCodeState, GCodeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GCodeState, GCodeState>,
              GCodeState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tolerance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(toleranceService)
final toleranceServiceProvider = ToleranceServiceProvider._();

final class ToleranceServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<ToleranceService>,
          ToleranceService,
          FutureOr<ToleranceService>
        >
    with $FutureModifier<ToleranceService>, $FutureProvider<ToleranceService> {
  ToleranceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toleranceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toleranceServiceHash();

  @$internal
  @override
  $FutureProviderElement<ToleranceService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ToleranceService> create(Ref ref) {
    return toleranceService(ref);
  }
}

String _$toleranceServiceHash() => r'd36ec1943eb6bc14a0452a49cadbb2ccd708c55e';

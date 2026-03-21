// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_codes_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gCodesRepository)
final gCodesRepositoryProvider = GCodesRepositoryProvider._();

final class GCodesRepositoryProvider
    extends
        $FunctionalProvider<
          GCodesRepository,
          GCodesRepository,
          GCodesRepository
        >
    with $Provider<GCodesRepository> {
  GCodesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gCodesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gCodesRepositoryHash();

  @$internal
  @override
  $ProviderElement<GCodesRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GCodesRepository create(Ref ref) {
    return gCodesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GCodesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GCodesRepository>(value),
    );
  }
}

String _$gCodesRepositoryHash() => r'6323381f340f216cb59310c372fab205313a562e';

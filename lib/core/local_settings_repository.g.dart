// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_settings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the [LocalSettingsRepository] instance.

@ProviderFor(localSettingsRepository)
final localSettingsRepositoryProvider = LocalSettingsRepositoryProvider._();

/// Provider for the [LocalSettingsRepository] instance.

final class LocalSettingsRepositoryProvider
    extends
        $FunctionalProvider<
          LocalSettingsRepository,
          LocalSettingsRepository,
          LocalSettingsRepository
        >
    with $Provider<LocalSettingsRepository> {
  /// Provider for the [LocalSettingsRepository] instance.
  LocalSettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSettingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSettingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalSettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalSettingsRepository create(Ref ref) {
    return localSettingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalSettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalSettingsRepository>(value),
    );
  }
}

String _$localSettingsRepositoryHash() =>
    r'f6b99f2ac5f21b78ea54ce667b9e3d40648c3c64';

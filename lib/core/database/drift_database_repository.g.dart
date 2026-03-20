// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(databaseRepository)
final databaseRepositoryProvider = DatabaseRepositoryProvider._();

final class DatabaseRepositoryProvider
    extends
        $FunctionalProvider<
          IDatabaseRepository,
          IDatabaseRepository,
          IDatabaseRepository
        >
    with $Provider<IDatabaseRepository> {
  DatabaseRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseRepositoryHash();

  @$internal
  @override
  $ProviderElement<IDatabaseRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IDatabaseRepository create(Ref ref) {
    return databaseRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDatabaseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDatabaseRepository>(value),
    );
  }
}

String _$databaseRepositoryHash() =>
    r'c3f44a66898966859575b9d0710eb61e96e8ac9e';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the singleton instance of the [IDatabaseRepository].
///
/// By watching [databaseProvider], it ensures the repository is always
/// linked to an active database session.

@ProviderFor(databaseRepository)
final databaseRepositoryProvider = DatabaseRepositoryProvider._();

/// Provides the singleton instance of the [IDatabaseRepository].
///
/// By watching [databaseProvider], it ensures the repository is always
/// linked to an active database session.

final class DatabaseRepositoryProvider
    extends
        $FunctionalProvider<
          IDatabaseRepository,
          IDatabaseRepository,
          IDatabaseRepository
        >
    with $Provider<IDatabaseRepository> {
  /// Provides the singleton instance of the [IDatabaseRepository].
  ///
  /// By watching [databaseProvider], it ensures the repository is always
  /// linked to an active database session.
  DatabaseRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseRepositoryProvider',
        isAutoDispose: false,
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
    r'062527391836a9f015e2db3e5b7c7b866440f982';

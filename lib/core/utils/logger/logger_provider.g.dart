// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides a global singleton instance of the application logger.
///
/// Returns an [IAppLogger] interface to decouple the logging logic
/// from its specific implementation ([AppLogger]).
/// This approach facilitates easy swapping with a MockLogger during unit tests.

@ProviderFor(appLogger)
final appLoggerProvider = AppLoggerProvider._();

/// Provides a global singleton instance of the application logger.
///
/// Returns an [IAppLogger] interface to decouple the logging logic
/// from its specific implementation ([AppLogger]).
/// This approach facilitates easy swapping with a MockLogger during unit tests.

final class AppLoggerProvider
    extends $FunctionalProvider<IAppLogger, IAppLogger, IAppLogger>
    with $Provider<IAppLogger> {
  /// Provides a global singleton instance of the application logger.
  ///
  /// Returns an [IAppLogger] interface to decouple the logging logic
  /// from its specific implementation ([AppLogger]).
  /// This approach facilitates easy swapping with a MockLogger during unit tests.
  AppLoggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLoggerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLoggerHash();

  @$internal
  @override
  $ProviderElement<IAppLogger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAppLogger create(Ref ref) {
    return appLogger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAppLogger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAppLogger>(value),
    );
  }
}

String _$appLoggerHash() => r'd71bf30563e769949c3a94d942b934ff76260b39';

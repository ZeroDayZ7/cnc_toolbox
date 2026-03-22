// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_init_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Orchestrates the application bootstrap process.
///
/// This provider performs critical startup tasks in sequence:
/// 1. Verifies [IDatabaseRepository] health.
/// 2. Warms up core providers ([themeProvider], [localeProvider], etc.).
/// 3. Pre-loads heavy resources like tolerances and history.
/// 4. Ensures the splash screen remains visible for [AppConfig.minSplashDuration].
///
/// Returns a [Result] indicating success or the specific [AppException] encountered.

@ProviderFor(appInit)
final appInitProvider = AppInitProvider._();

/// Orchestrates the application bootstrap process.
///
/// This provider performs critical startup tasks in sequence:
/// 1. Verifies [IDatabaseRepository] health.
/// 2. Warms up core providers ([themeProvider], [localeProvider], etc.).
/// 3. Pre-loads heavy resources like tolerances and history.
/// 4. Ensures the splash screen remains visible for [AppConfig.minSplashDuration].
///
/// Returns a [Result] indicating success or the specific [AppException] encountered.

final class AppInitProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<void>>,
          Result<void>,
          FutureOr<Result<void>>
        >
    with $FutureModifier<Result<void>>, $FutureProvider<Result<void>> {
  /// Orchestrates the application bootstrap process.
  ///
  /// This provider performs critical startup tasks in sequence:
  /// 1. Verifies [IDatabaseRepository] health.
  /// 2. Warms up core providers ([themeProvider], [localeProvider], etc.).
  /// 3. Pre-loads heavy resources like tolerances and history.
  /// 4. Ensures the splash screen remains visible for [AppConfig.minSplashDuration].
  ///
  /// Returns a [Result] indicating success or the specific [AppException] encountered.
  AppInitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitHash();

  @$internal
  @override
  $FutureProviderElement<Result<void>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<void>> create(Ref ref) {
    return appInit(ref);
  }
}

String _$appInitHash() => r'13169b5b0eb81b60f54ab5ab458fb26bb9dc4f4b';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRoute];

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/',
  factory: $HomeRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'settings', factory: $SettingsRoute._fromState),
    GoRouteData.$route(
      path: 'cutting-speed',
      factory: $CuttingSpeedRoute._fromState,
    ),
    GoRouteData.$route(path: 'feed-rate', factory: $FeedRateRoute._fromState),
    GoRouteData.$route(
      path: 'spindle-speed',
      factory: $SpindleSpeedRoute._fromState,
    ),
    GoRouteData.$route(path: 'tap-drill', factory: $TapDrillRoute._fromState),
    GoRouteData.$route(path: 'converter', factory: $ConverterRoute._fromState),
    GoRouteData.$route(
      path: 'tolerances',
      factory: $TolerancesRoute._fromState,
    ),
    GoRouteData.$route(path: 'g-codes', factory: $GCodesRoute._fromState),
    GoRouteData.$route(
      path: 'gd-symbols',
      factory: $GdSymbolsRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'details',
          factory: $GdSymbolDetailsRoute._fromState,
        ),
      ],
    ),
  ],
);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CuttingSpeedRoute on GoRouteData {
  static CuttingSpeedRoute _fromState(GoRouterState state) =>
      const CuttingSpeedRoute();

  @override
  String get location => GoRouteData.$location('/cutting-speed');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FeedRateRoute on GoRouteData {
  static FeedRateRoute _fromState(GoRouterState state) => const FeedRateRoute();

  @override
  String get location => GoRouteData.$location('/feed-rate');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SpindleSpeedRoute on GoRouteData {
  static SpindleSpeedRoute _fromState(GoRouterState state) =>
      const SpindleSpeedRoute();

  @override
  String get location => GoRouteData.$location('/spindle-speed');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $TapDrillRoute on GoRouteData {
  static TapDrillRoute _fromState(GoRouterState state) => const TapDrillRoute();

  @override
  String get location => GoRouteData.$location('/tap-drill');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ConverterRoute on GoRouteData {
  static ConverterRoute _fromState(GoRouterState state) =>
      const ConverterRoute();

  @override
  String get location => GoRouteData.$location('/converter');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $TolerancesRoute on GoRouteData {
  static TolerancesRoute _fromState(GoRouterState state) =>
      const TolerancesRoute();

  @override
  String get location => GoRouteData.$location('/tolerances');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GCodesRoute on GoRouteData {
  static GCodesRoute _fromState(GoRouterState state) => const GCodesRoute();

  @override
  String get location => GoRouteData.$location('/g-codes');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GdSymbolsRoute on GoRouteData {
  static GdSymbolsRoute _fromState(GoRouterState state) =>
      const GdSymbolsRoute();

  @override
  String get location => GoRouteData.$location('/gd-symbols');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GdSymbolDetailsRoute on GoRouteData {
  static GdSymbolDetailsRoute _fromState(GoRouterState state) =>
      GdSymbolDetailsRoute($extra: state.extra as String?);

  GdSymbolDetailsRoute get _self => this as GdSymbolDetailsRoute;

  @override
  String get location => GoRouteData.$location('/gd-symbols/details');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the global [GoRouter] instance.
///
/// Includes custom [errorBuilder] for 404 handling and
/// enables [debugLogDiagnostics] in development mode.

@ProviderFor(router)
final routerProvider = RouterProvider._();

/// Provides the global [GoRouter] instance.
///
/// Includes custom [errorBuilder] for 404 handling and
/// enables [debugLogDiagnostics] in development mode.

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Provides the global [GoRouter] instance.
  ///
  /// Includes custom [errorBuilder] for 404 handling and
  /// enables [debugLogDiagnostics] in development mode.
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'b10141047e8cc6cd29274efb1c71491e65316429';

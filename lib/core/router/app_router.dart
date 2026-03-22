import 'package:cnc_toolbox/core/app/presentation/not_found_page.dart';
import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Page imports
import '../../features/converter/presentation/pages/converter_page.dart';
import '../../features/cutting_speed/presentation/pages/cutting_speed_page.dart';
import '../../features/feed_rate/presentation/pages/feed_rate_page.dart';
import '../../features/g_codes/presentation/pages/g_codes_page.dart';
import '../../features/gd&t_symbols/data/symbols_data.dart';
import '../../features/gd&t_symbols/presentation/pages/symbol_details_page.dart';
import '../../features/gd&t_symbols/presentation/pages/symbols_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/spindle_speed/spindle_speed_page.dart';
import '../../features/tap_drill/presentation/pages/tap_drill_page.dart';
import '../../features/tolerances/presentation/pages/tolerance_page.dart';

part 'app_router.g.dart';

/// Central navigation configuration using type-safe routes.
///
/// This structure defines the entire application tree, ensuring that
/// parameters and route names are checked at compile-time.
@TypedGoRoute<HomeRoute>(
  path: Routes.home,
  routes: [
    TypedGoRoute<SettingsRoute>(path: 'settings'),
    TypedGoRoute<CuttingSpeedRoute>(path: 'cutting-speed'),
    TypedGoRoute<FeedRateRoute>(path: 'feed-rate'),
    TypedGoRoute<SpindleSpeedRoute>(path: 'spindle-speed'),
    TypedGoRoute<TapDrillRoute>(path: 'tap-drill'),
    TypedGoRoute<ConverterRoute>(path: 'converter'),
    TypedGoRoute<TolerancesRoute>(path: 'tolerances'),
    TypedGoRoute<GCodesRoute>(path: 'g-codes'),
    TypedGoRoute<GdSymbolsRoute>(
      path: 'gd-symbols',
      routes: [TypedGoRoute<GdSymbolDetailsRoute>(path: ':symbolName')],
    ),
  ],
)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

class CuttingSpeedRoute extends GoRouteData with $CuttingSpeedRoute {
  const CuttingSpeedRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CuttingSpeedPage();
}

class FeedRateRoute extends GoRouteData with $FeedRateRoute {
  const FeedRateRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FeedRatePage();
}

class SpindleSpeedRoute extends GoRouteData with $SpindleSpeedRoute {
  const SpindleSpeedRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SpindleSpeedPage();
}

class TapDrillRoute extends GoRouteData with $TapDrillRoute {
  const TapDrillRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TapDrillPage();
}

class ConverterRoute extends GoRouteData with $ConverterRoute {
  const ConverterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ConverterPage();
}

class TolerancesRoute extends GoRouteData with $TolerancesRoute {
  const TolerancesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TolerancePage();
}

class GCodesRoute extends GoRouteData with $GCodesRoute {
  const GCodesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const GCodesPage();
}

class GdSymbolsRoute extends GoRouteData with $GdSymbolsRoute {
  const GdSymbolsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GdSymbolsPage();
}

/// Detailed view for a specific GD&T symbol.
class GdSymbolDetailsRoute extends GoRouteData with $GdSymbolDetailsRoute {
  final String symbolName;

  const GdSymbolDetailsRoute({required this.symbolName});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final symbol = gdSymbolsList.firstWhereOrNull((s) => s.id == symbolName);

    if (symbol == null) {
      return const NotFoundPage(message: 'Nie znaleziono symbolu GD&T');
    }

    return GdSymbolDetailsPage(symbol: symbol);
  }
}

/// Provides the global [GoRouter] instance.
///
/// Includes custom [errorBuilder] for 404 handling and
/// enables [debugLogDiagnostics] in development mode.
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: $appRoutes,
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}

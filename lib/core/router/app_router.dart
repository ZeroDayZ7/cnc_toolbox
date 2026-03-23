import 'package:cnc_toolbox/core/app/presentation/not_found_page.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/router/app_tool_route.dart';
import 'package:cnc_toolbox/features/converter/presentation/pages/converter_page.dart';
import 'package:cnc_toolbox/features/cutting_speed/presentation/pages/cutting_speed_page.dart';
import 'package:cnc_toolbox/features/feed_rate/presentation/pages/feed_rate_page.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/pages/g_codes_page.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/data/symbols_data.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/pages/symbol_details_page.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/pages/symbols_page.dart';
import 'package:cnc_toolbox/features/home/presentation/pages/home_page.dart';
import 'package:cnc_toolbox/features/settings/presentation/pages/settings_page.dart';
import 'package:cnc_toolbox/features/spindle_speed/spindle_speed_page.dart';
import 'package:cnc_toolbox/features/tap_drill/presentation/pages/tap_drill_page.dart';
import 'package:cnc_toolbox/features/tolerances/presentation/pages/tolerance_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// --- MIXIN: Ta "supermoc" dodaje logikę do tras narzędzi ---
mixin ToolRouteMixin on GoRouteData implements AppToolRoute {
  @override
  void navigateTo(BuildContext context) => (this as GoRouteData).go(context);

  @override
  bool isActive(String location) => location == path;
}

@TypedGoRoute<HomeRoute>(
  path: '/',
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

// --- TOOL ROUTES (Z wykorzystaniem Mixina) ---

class CuttingSpeedRoute extends GoRouteData
    with $CuttingSpeedRoute, ToolRouteMixin {
  const CuttingSpeedRoute();
  @override
  String get path => '/cutting-speed';
  @override
  IconData get icon => Icons.speed;
  @override
  String get labelKey => LocaleKeys.tools_cutting_speed;
  @override
  String get descriptionKey => LocaleKeys.descriptions_cutting_speed;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CuttingSpeedPage();
}

class FeedRateRoute extends GoRouteData with $FeedRateRoute, ToolRouteMixin {
  const FeedRateRoute();
  @override
  String get path => '/feed-rate';
  @override
  IconData get icon => Icons.unfold_more;
  @override
  String get labelKey => LocaleKeys.tools_feed_rate;
  @override
  String get descriptionKey => LocaleKeys.descriptions_feed_rate;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FeedRatePage();
}

class SpindleSpeedRoute extends GoRouteData
    with $SpindleSpeedRoute, ToolRouteMixin {
  const SpindleSpeedRoute();
  @override
  String get path => '/spindle-speed';
  @override
  IconData get icon => Icons.settings_backup_restore;
  @override
  String get labelKey => LocaleKeys.tools_spindle_rpm;
  @override
  String get descriptionKey => LocaleKeys.descriptions_spindle_rpm;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SpindleSpeedPage();
}

class TapDrillRoute extends GoRouteData with $TapDrillRoute, ToolRouteMixin {
  const TapDrillRoute();
  @override
  String get path => '/tap-drill';
  @override
  IconData get icon => Icons.build;
  @override
  String get labelKey => LocaleKeys.tools_tap_drill;
  @override
  String get descriptionKey => LocaleKeys.descriptions_tap_drill;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TapDrillPage();
}

class ConverterRoute extends GoRouteData with $ConverterRoute, ToolRouteMixin {
  const ConverterRoute();
  @override
  String get path => '/converter';
  @override
  IconData get icon => Icons.straighten;
  @override
  String get labelKey => LocaleKeys.tools_unit_converter;
  @override
  String get descriptionKey => LocaleKeys.descriptions_unit_converter;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ConverterPage();
}

class TolerancesRoute extends GoRouteData
    with $TolerancesRoute, ToolRouteMixin {
  const TolerancesRoute();
  @override
  String get path => '/tolerances';
  @override
  IconData get icon => Icons.precision_manufacturing;
  @override
  String get labelKey => LocaleKeys.tools_tolerances;
  @override
  String get descriptionKey => LocaleKeys.descriptions_tolerances;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TolerancePage();
}

class GCodesRoute extends GoRouteData with $GCodesRoute, ToolRouteMixin {
  const GCodesRoute();
  @override
  String get path => '/g-codes';
  @override
  IconData get icon => Icons.code;
  @override
  String get labelKey => LocaleKeys.tools_g_codes;
  @override
  String get descriptionKey => LocaleKeys.descriptions_g_codes;

  @override
  Widget build(BuildContext context, GoRouterState state) => const GCodesPage();
}

class GdSymbolsRoute extends GoRouteData with $GdSymbolsRoute, ToolRouteMixin {
  const GdSymbolsRoute();
  @override
  String get path => '/gd-symbols';
  @override
  IconData get icon => Icons.architecture;
  @override
  String get labelKey => LocaleKeys.tools_gd_symbols;
  @override
  String get descriptionKey => LocaleKeys.descriptions_gd_symbols;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GdSymbolsPage();
}

// --- DETAILS ---

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

// --- NAVIGATION CONFIG ---

final appNavigation = <AppToolRoute>[
  const CuttingSpeedRoute(),
  const SpindleSpeedRoute(),
  const FeedRateRoute(),
  const TapDrillRoute(),
  const ConverterRoute(),
  const TolerancesRoute(),
  const GdSymbolsRoute(),
  const GCodesRoute(),
];

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: $appRoutes,
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/features/converter/converter_page.dart';
import 'package:cnc_toolbox/features/cutting_speed/cutting_speed_page.dart';
import 'package:cnc_toolbox/features/feed_rate/feed_rate_page.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/g_codes_page.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/symbol_details_page.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/presentation/symbols_page.dart';
import 'package:cnc_toolbox/features/home/home_page.dart';
import 'package:cnc_toolbox/features/settings/settings_page.dart';
import 'package:cnc_toolbox/features/spindle_speed/spindle_speed_page.dart';
import 'package:cnc_toolbox/features/tap_drill/tap_drill_page.dart';
import 'package:cnc_toolbox/features/tolerances/tolerance_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.settings,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: Routes.cuttingSpeed,
        name: 'cutting_speed',
        builder: (context, state) => const CuttingSpeedPage(),
      ),
      GoRoute(
        path: Routes.feedRate,
        name: 'feed_rate',
        builder: (context, state) => const FeedRatePage(),
      ),
      GoRoute(
        path: Routes.spindleSpeed,
        name: 'spindle_speed',
        builder: (context, state) => const SpindleSpeedPage(),
      ),
      GoRoute(
        path: Routes.tapDrill,
        name: 'tap_drill',
        builder: (context, state) => const TapDrillPage(),
      ),
      GoRoute(
        path: Routes.converter,
        name: 'converter',
        builder: (context, state) => const ConverterPage(),
      ),
      GoRoute(
        path: Routes.tolerances,
        name: 'tolerances',
        builder: (context, state) => const TolerancePage(),
      ),
      GoRoute(
        path: Routes.gCodes,
        name: 'g_codes',
        builder: (context, state) => const GCodesPage(),
      ),
      GoRoute(
        path: '/gd-symbols',
        builder: (context, state) => const GdSymbolsPage(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) {
              final symbol = state.extra as GdSymbol;
              return GdSymbolDetailsPage(symbol: symbol);
            },
          ),
        ],
      ),
    ],
  );
});

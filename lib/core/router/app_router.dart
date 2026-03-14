import 'package:cnc_toolbox/features/cutting_speed/cutting_speed_page.dart';
import 'package:cnc_toolbox/features/feed_rate/feed_rate_page.dart';
import 'package:cnc_toolbox/features/home/home_page.dart';
import 'package:cnc_toolbox/features/settings/settings_page.dart';
import 'package:cnc_toolbox/features/spindle_speed/spindle_speed_page.dart';
import 'package:cnc_toolbox/features/tap_drill/tap_drill_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: '/cutting-speed',
        name: 'cutting_speed',
        builder: (context, state) => const CuttingSpeedPage(),
      ),
      GoRoute(
        path: '/feed-rate',
        name: 'feed_rate',
        builder: (context, state) => const FeedRatePage(),
      ),
      GoRoute(
        path: '/spindle-speed',
        name: 'spindle_speed',
        builder: (context, state) => const SpindleSpeedPage(),
      ),
      GoRoute(
        path: '/tap-drill',
        name: 'tap_drill',
        builder: (context, state) => const TapDrillPage(),
      ),
    ],
  );
});

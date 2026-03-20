import 'package:cnc_toolbox/core/app/app_init_provider.dart';
import 'package:cnc_toolbox/core/app/app_init_status.dart';
import 'package:cnc_toolbox/core/app/presentation/error_app.dart';
import 'package:cnc_toolbox/core/app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBootstrapHandler extends ConsumerStatefulWidget {
  final Widget child;
  const AppBootstrapHandler({super.key, required this.child});

  @override
  ConsumerState<AppBootstrapHandler> createState() =>
      _AppBootstrapHandlerState();
}

class _AppBootstrapHandlerState extends ConsumerState<AppBootstrapHandler> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(appInitProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(appInitProvider);

    return status.when(
      loading: (key) => const SplashScreen(),
      blocked: (reason) => ErrorApp(error: reason ?? 'Unknown System Failure'),
      ready: () => widget.child,
    );
  }
}

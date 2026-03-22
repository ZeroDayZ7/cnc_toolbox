import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = LocaleKeys.splash_loading.tr();
    final colorScheme = Theme.of(context).colorScheme;

    return AppScaffold(
      scrollable: false,
      useSafeArea: true,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppInfo.appName.toUpperCase(),
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: 6,
              ),
            ),
            const SizedBox(height: 60),
            const SpinKitFoldingCube(color: Colors.blueAccent, size: 35.0),
            const SizedBox(height: 60),
            Text(
              message,
              style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 10,
                fontFamily: 'Monospace',
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            Opacity(
              opacity: 0.4,
              child: Text(
                'VERSION ${AppInfo.appVersion}',
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 12,
                  // ...
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

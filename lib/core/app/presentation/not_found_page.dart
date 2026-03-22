import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String? message;

  const NotFoundPage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.report_problem_rounded,
                size: 80,
                color: context.cncColors.toolStatus,
              ),
              AppSpacings.gapM,
              Text(
                '404',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.cncColors.machineActive,
                ),
              ),
              AppSpacings.gapM,
              Text(
                message ?? LocaleKeys.error_page_not_found.tr(),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => const HomeRoute().go(context),
                icon: const Icon(Icons.home),
                label: Text(LocaleKeys.error_go_home.tr()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.cncColors.machineActive?.withValues(
                    alpha: 0.1,
                  ),
                  foregroundColor: context.cncColors.machineActive,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cnc_toolbox/core/app/app_init_provider.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorApp extends ConsumerWidget {
  final String error;
  final VoidCallback? onRetry;

  const ErrorApp({super.key, required this.error, this.onRetry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.terminal_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 32),
              Text(
                LocaleKeys.splash_error_title.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacings.gapM,

              // Kontener na techniczny opis błędu
              Container(
                padding: AppSpacings.edgeInsetsM,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white10),
                ),
                child: Text(
                  error,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Monospace',
                    fontSize: 12,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Przycisk "Spróbuj ponownie" z tłumaczeniem
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: onRetry ?? () => ref.invalidate(appInitProvider),
                  icon: const Icon(Icons.refresh_rounded),
                  label: Text(
                    LocaleKeys.splash_retry.tr(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
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

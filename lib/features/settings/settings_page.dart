import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/features/settings/widgets/language_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/about_section.dart';
import 'widgets/dark_mode_switch.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => const HomeRoute().go(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SettingsContainer(
            title: LocaleKeys.appearance.tr(),
            child: const DarkModeSwitch(),
          ),
          const SizedBox(height: 16),

          _SettingsContainer(
            title: LocaleKeys.language.tr(),
            child: const LanguageTile(),
          ),
          const SizedBox(height: 16),

          _SettingsContainer(
            title: LocaleKeys.preferences.tr(),
            child: Column(
              children: [
                ListTile(
                  title: Text(LocaleKeys.unit_system.tr()),
                  subtitle: Text(LocaleKeys.unit_system_desc.tr()),
                  leading: const Icon(Icons.straighten),
                ),
                ListTile(
                  title: Text(LocaleKeys.notifications.tr()),
                  subtitle: Text(LocaleKeys.notifications_desc.tr()),
                  leading: const Icon(Icons.notifications),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _SettingsContainer(
            title: LocaleKeys.about.tr(),
            child: const AboutSection(),
          ),
        ],
      ),
    );
  }
}

class _SettingsContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const _SettingsContainer({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

import 'package:cnc_toolbox/core/theme/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'locale_notifier.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  void _showLanguagePicker(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.read(localeProvider);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Polski'),
              trailing: currentLocale.languageCode == 'pl'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                context.setLocale(const Locale('pl'));
                ref.read(localeProvider.notifier).setLocale(const Locale('pl'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('English'),
              trailing: currentLocale.languageCode == 'en'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                context.setLocale(const Locale('en'));
                ref.read(localeProvider.notifier).setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('dark_mode'.tr()),
            value: isDarkMode,
            onChanged: (val) => themeNotifier.toggleTheme(val),
          ),
          ListTile(
            title: Text('language'.tr()),
            subtitle: Text(
              currentLocale.languageCode == 'pl' ? 'Polski' : 'English',
            ),
            trailing: const Icon(Icons.keyboard_arrow_up),
            onTap: () => _showLanguagePicker(context, ref),
          ),
        ],
      ),
    );
  }
}

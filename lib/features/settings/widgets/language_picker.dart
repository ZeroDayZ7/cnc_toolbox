import 'package:cnc_toolbox/core/localization/app_languages.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguagePicker extends ConsumerWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pobieramy aktualny locale z EasyLocalization
    final currentLocale = context.locale;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacings.m),
          child: Text(
            LocaleKeys.select_language.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...AppLanguage.values.map((lang) {
          final isSelected =
              lang.locale.languageCode == currentLocale.languageCode;

          return ListTile(
            leading: Text(lang.flag, style: const TextStyle(fontSize: 24)),
            title: Text(lang.name),
            trailing: isSelected
                ? Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () async {
              final navigator = Navigator.of(context);
              ref.read(localeProvider.notifier).setLocale(lang);
              await context.setLocale(lang.locale);

              navigator.pop();
            },
          );
        }),
        AppSpacings.gapM,
      ],
    );
  }
}

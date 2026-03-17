// lib/features/converter/widgets/settings_sheet.dart

import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/application/converter_settings_provider.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsSheet extends ConsumerWidget {
  final String categoryId;
  final List<UnitDefinition> units;

  const SettingsSheet({
    super.key,
    required this.categoryId,
    required this.units,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      // Ustawiamy wysokość na np. 60% ekranu
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.converter_input.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(LocaleKeys.converter_result.tr()),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: units.length,
              itemBuilder: (context, index) {
                final unit = units[index];
                final isVisible = settings.isUnitVisible(categoryId, unit.id);

                return CheckboxListTile(
                  title: Text(unit.label.tr()),
                  secondary: Text(
                    unit.symbol,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  value: isVisible,
                  onChanged: (bool? value) {
                    ref
                        .read(settingsProvider.notifier)
                        .toggleUnit(categoryId, unit.id);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              LocaleKeys.converter_settings_hint.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

// lib/features/converter/widgets/settings_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/converter_settings_provider.dart';

class SettingsSheet extends ConsumerWidget {
  final String categoryId;
  final List units; // Lista wszystkich jednostek z repozytorium

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
                  "Widoczne jednostki",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Gotowe"),
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
                // Sprawdzamy czy jednostka jest włączona
                final isVisible = settings.isUnitVisible(categoryId, unit.id);

                return CheckboxListTile(
                  title: Text(unit.label),
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
              "Odznacz jednostki, których nie używasz na co dzień.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cnc_toolbox/features/cutting_speed/cutting_speed_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_field.dart';

class CuttingSpeedInputSection extends ConsumerWidget {
  final TextEditingController dController;
  final TextEditingController nController;
  final TextEditingController fzController;
  final TextEditingController zController;

  const CuttingSpeedInputSection({
    super.key,
    required this.dController,
    required this.nController,
    required this.fzController,
    required this.zController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cuttingSpeedProvider);
    final notifier = ref.read(cuttingSpeedProvider.notifier);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Pierwszy wiersz: średnica i RPM
            Row(
              children: [
                Expanded(
                  child: CustomField(
                    label: 'tool_diameter'.tr(),
                    suffix: 'mm',
                    controller: dController,
                    onChanged: (v) =>
                        notifier.updateInputs(d: double.tryParse(v)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomField(
                    label: 'spindle_rpm'.tr(),
                    suffix: 'RPM',
                    controller: nController,
                    onChanged: (v) => notifier.updateInputs(n: int.tryParse(v)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Dropdown materiału z tłumaczeniem
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'material'.tr(),
                border: const OutlineInputBorder(),
              ),
              initialValue: state.material, // poprawne użycie Riverpod
              items: ['Steel', 'Aluminum', 'Stainless', 'Titanium']
                  .map(
                    (mat) => DropdownMenuItem(
                      value: mat,
                      child: Text(mat.tr()), // tłumaczenie
                    ),
                  )
                  .toList(),
              onChanged: (v) {
                if (v != null) notifier.updateInputs(mat: v);
              },
            ),

            const SizedBox(height: 16),

            // Drugi wiersz: posuw na ząb i liczba zębów
            Row(
              children: [
                Expanded(
                  child: CustomField(
                    label: 'fz_per_tooth'.tr(),
                    suffix: 'mm/z',
                    controller: fzController,
                    onChanged: (v) =>
                        notifier.updateInputs(fz: double.tryParse(v)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomField(
                    label: 'teeth_count'.tr(),
                    suffix: 'Z',
                    controller: zController,
                    onChanged: (v) => notifier.updateInputs(z: int.tryParse(v)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

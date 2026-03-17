import 'package:cnc_toolbox/features/converter/application/converter_provider.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class ConverterInputs extends ConsumerWidget {
  final List<UnitDefinition> units;
  final Map<String, TextEditingController> controllers;
  final String categoryId;

  const ConverterInputs({
    super.key,
    required this.units,
    required this.controllers,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(converterProvider(categoryId));

    final filteredUnits =
        units; // Możesz tu podpiąć settingsProvider, żeby filtrować widoczne unit

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filteredUnits.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final unit = filteredUnits[index];
        final value = state.values[unit.id] ?? "";

        final controller = controllers.putIfAbsent(
          unit.id,
          () => TextEditingController(),
        );

        if (controller.text != value) {
          controller.value = controller.value.copyWith(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          );
        }

        return TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: unit.label.tr(),
            suffixText: unit.symbol,
            suffixStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            border: const OutlineInputBorder(),
          ),
          onChanged: (val) {
            ref
                .read(converterProvider(categoryId).notifier)
                .updateValue(unit.id, val, filteredUnits.cast());
          },
        );
      },
    );
  }
}

import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/converter/application/converter_provider.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConverterInputs extends HookConsumerWidget {
  final List<UnitDefinition> units;
  final ConverterCategory category;

  const ConverterInputs({
    super.key,
    required this.units,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: AppSpacings.edgeInsetsM,
      itemCount: units.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _UnitRow(
          key: ValueKey(units[index].id),
          unit: units[index],
          category: category,
          allUnits: units,
        );
      },
    );
  }
}

class _UnitRow extends HookConsumerWidget {
  final UnitDefinition unit;
  final ConverterCategory category;
  final List<UnitDefinition> allUnits;

  const _UnitRow({
    super.key,
    required this.unit,
    required this.category,
    required this.allUnits,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(converterProvider(category));
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final value = state.values[unit.id] ?? "";

    useEffect(() {
      if (!focusNode.hasFocus && controller.text != value) {
        controller.text = value;
      }
      return null;
    }, [value, focusNode.hasFocus]);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: unit.label.tr(),
        suffixText: unit.symbol,
      ),
      onChanged: (val) {
        ref
            .read(converterProvider(category).notifier)
            .updateValue(unit.id, val, allUnits);
      },
    );
  }
}

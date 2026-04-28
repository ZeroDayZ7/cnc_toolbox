import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/converter/application/converter_provider.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:cnc_toolbox/features/converter/models/unit_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 1. ConverterInputs zmieniamy na zwykły ConsumerWidget (nie potrzebuje stanu)
class ConverterInputs extends ConsumerWidget {
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
      separatorBuilder: (_, _) => AppSpacings.gapMs,
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

// 2. _UnitRow staje się ConsumerStatefulWidget
class _UnitRow extends ConsumerStatefulWidget {
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
  ConsumerState<_UnitRow> createState() => _UnitRowState();
}

class _UnitRowState extends ConsumerState<_UnitRow> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Inicjalizacja kontrolera z obecną wartością z providera
    final initialValue =
        ref.read(converterProvider(widget.category)).values[widget.unit.id] ??
        "";
    _controller = TextEditingController(text: initialValue);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Ręczne sprzątanie zasobów - to zastępuje automatykę z hooków
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(converterProvider(widget.category));
    final value = state.values[widget.unit.id] ?? "";

    if (!_focusNode.hasFocus && _controller.text != value) {
      // Używamy Future.microtask lub WidgetsBinding, aby uniknąć błędów
      // budowania widżetu podczas zmiany stanu kontrolera
      Future.microtask(() {
        if (mounted && !_focusNode.hasFocus) {
          _controller.text = value;
        }
      });
    }

    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: widget.unit.label.tr(),
        suffixText: widget.unit.symbol,
      ),
      onChanged: (val) {
        ref
            .read(converterProvider(widget.category).notifier)
            .updateValue(widget.unit.id, val, widget.allUnits);
      },
    );
  }
}

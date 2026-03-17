import 'package:flutter/material.dart';

class ConverterInputs extends StatelessWidget {
  final List units;
  final Map values;
  final Map<String, TextEditingController> controllers;
  final Function(String, String) onChanged;

  const ConverterInputs({
    super.key,
    required this.units,
    required this.values,
    required this.controllers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: units.length,
      itemBuilder: (context, index) {
        final unit = units[index];
        final controller = controllers.putIfAbsent(
          unit.id,
          () => TextEditingController(),
        );

        return TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: unit.label,
            suffixText: unit.symbol,
          ),
          onChanged: (val) => onChanged(unit.id, val),
        );
      },
    );
  }
}

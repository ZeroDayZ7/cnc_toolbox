// lib/widgets/custom_field.dart
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String suffix;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomField({
    super.key,
    required this.label,
    required this.suffix,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}

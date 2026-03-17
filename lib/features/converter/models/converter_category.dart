// lib/features/converter/data/models/converter_category.dart
import 'package:flutter/material.dart';

class ConverterCategory {
  final String id;
  final IconData icon;
  final String label;
  final List units;

  const ConverterCategory({
    required this.id,
    required this.icon,
    required this.label,
    required this.units,
  });
}

import 'package:flutter/material.dart';

class ToolItem {
  final IconData icon;
  final String labelKey;
  final String descriptionKey;
  final String route;

  const ToolItem({
    required this.icon,
    required this.labelKey,
    required this.descriptionKey,
    required this.route,
  });
}

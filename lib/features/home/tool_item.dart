import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToolItem {
  final IconData icon;
  final String labelKey;
  final String descriptionKey;
  final GoRouteData route;

  const ToolItem({
    required this.icon,
    required this.labelKey,
    required this.descriptionKey,
    required this.route,
  });
}

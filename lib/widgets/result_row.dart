// lib/widgets/result_row.dart
import 'package:flutter/material.dart';

class ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final String? subValue;

  const ResultRow({
    super.key,
    required this.label,
    required this.value,
    this.subValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (subValue != null)
              Text(subValue!, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}

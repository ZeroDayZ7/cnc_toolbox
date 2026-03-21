import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:cnc_toolbox/widgets/info_components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToleranceResultDisplay extends StatelessWidget {
  final ToleranceResult res;

  const ToleranceResultDisplay({super.key, required this.res});

  String _formatValue(double? value, {bool showPlus = false}) {
    if (value == null) return "-";
    final formatted = value.toStringAsFixed(3);
    if (showPlus && value > 0) return "+$formatted";
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final hasCalculations =
        res.upperDeviation != null && res.lowerDeviation != null;

    return Column(
      children: [
        if (res.infoKey != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoTipCard(text: res.infoKey!.tr()),
          ),
        if (res.restrictionKey != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoTipCard(text: res.restrictionKey!.tr()),
          ),
        if (hasCalculations) ...[
          DeviationTile(
            label: LocaleKeys.tolerance_upper_dev.tr(),
            value: "${_formatValue(res.upperDeviation, showPlus: true)} mm",
            color: Colors.green,
          ),
          DeviationTile(
            label: LocaleKeys.tolerance_lower_dev.tr(),
            value: "${_formatValue(res.lowerDeviation)} mm",
            color: Colors.red,
          ),
          AppSpacings.gapM,
          RealSizeCard(
            minSize: _formatValue(res.minSize),
            maxSize: _formatValue(res.maxSize),
          ),
        ],
      ],
    );
  }
}

class RealSizeCard extends StatelessWidget {
  final String minSize;
  final String maxSize;

  const RealSizeCard({super.key, required this.minSize, required this.maxSize});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            LocaleKeys.tolerance_real_size.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 8),
          Text(
            "Ø$minSize - Ø$maxSize",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

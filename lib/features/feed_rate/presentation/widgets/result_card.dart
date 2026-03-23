import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double vf;
  final double f;
  final bool isArc;

  const ResultCard({
    super.key,
    required this.vf,
    required this.f,
    this.isArc = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isArc
        ? Theme.of(context).colorScheme.onInverseSurface
        : Theme.of(context).colorScheme.primaryContainer;

    final textColor = isArc
        ? Colors
              .white
        : Theme.of(context).colorScheme.onPrimaryContainer;

    return Container(
      width: double.infinity,
      padding: AppSpacings.edgeInsetsL,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadii.radiusL,
      ),
      child: Column(
        children: [
          Text(
            isArc
                ? LocaleKeys.feed_results_compensated_feed.tr()
                : LocaleKeys.feed_results_linear_feed.tr(),
            style: TextStyle(color: textColor.withValues(alpha: 0.8)),
          ),
          Text(
            LocaleKeys.feed_results_unit_min_formatted.tr(
              args: [vf.toStringAsFixed(1)],
            ),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            LocaleKeys.feed_results_per_rev.tr(args: [f.toStringAsFixed(3)]),
            style: TextStyle(color: textColor.withValues(alpha: 0.9)),
          ),
        ],
      ),
    );
  }
}

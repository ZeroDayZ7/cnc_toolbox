import 'package:cnc_toolbox/features/cutting_speed/cutting_speed_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'result_row.dart';

class CuttingSpeedResultCard extends StatelessWidget {
  final CuttingSpeedState state;

  const CuttingSpeedResultCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ResultRow(
            label: 'cutting_speed_vc'.tr(),
            value: '${state.cuttingSpeed.toStringAsFixed(2)} m/min',
            subValue: '${state.cuttingSpeedFt.toStringAsFixed(2)} ft/min',
          ),
          const Divider(height: 32),
          ResultRow(
            label: 'feed_rate_f'.tr(),
            value: '${state.feedRate.toStringAsFixed(2)} mm/min',
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: state.cuttingSpeed.toStringAsFixed(2)),
              );
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('copied'.tr())));
            },
            icon: const Icon(Icons.copy),
            label: Text('copy_result'.tr()),
          ),
        ],
      ),
    );
  }
}

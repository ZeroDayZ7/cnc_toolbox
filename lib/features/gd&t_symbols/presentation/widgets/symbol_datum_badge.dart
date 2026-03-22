import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SymbolDatumBadge extends StatelessWidget {
  final GdSymbol symbol;

  const SymbolDatumBadge({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color statusColor = symbol.requiresDatum
        ? colorScheme.tertiary
        : colorScheme.outline;

    final Color bgColor = symbol.requiresDatum
        ? colorScheme.tertiaryContainer.withValues(alpha: 0.3)
        : colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            symbol.requiresDatum ? Icons.link : Icons.link_off,
            size: 18,
            color: statusColor,
          ),
          const SizedBox(width: 8),
          Text(
            symbol.requiresDatum
                ? LocaleKeys.gd_symbols_details_requires_datum.tr()
                : LocaleKeys.gd_symbols_details_no_datum.tr(),
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GdSymbolDetailsPage extends StatelessWidget {
  final GdSymbol symbol;
  const GdSymbolDetailsPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text(symbol.name.tr())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.outlineVariant.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: symbol.assetImage != null
                    ? InteractiveViewer(
                        clipBehavior: Clip.none,
                        panEnabled: true,
                        minScale: 1.0,
                        maxScale: 4.0,
                        child: Center(
                          child: Image.asset(
                            symbol.assetImage!,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          symbol.symbol,
                          style: const TextStyle(
                            fontFamily: 'NotoSansSymbols',
                            fontSize: 80,
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),

            // Sekcja statusu bazy (Datum)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: symbol.requiresDatum
                    ? Colors.orange.withValues(alpha: 0.1)
                    : Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    symbol.requiresDatum ? Icons.link : Icons.link_off,
                    size: 18,
                    color: symbol.requiresDatum ? Colors.orange : Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    symbol.requiresDatum
                        ? LocaleKeys.gd_symbols_details_requires_datum.tr()
                        : LocaleKeys.gd_symbols_details_no_datum.tr(),
                    style: TextStyle(
                      color: symbol.requiresDatum
                          ? Colors.orange
                          : Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Opis
            Text(
              symbol.description.tr(),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

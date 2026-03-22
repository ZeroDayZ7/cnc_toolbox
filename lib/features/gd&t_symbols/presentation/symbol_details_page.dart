import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'widgets/symbol_datum_badge.dart';
import 'widgets/symbol_image_card.dart';

class GdSymbolDetailsPage extends StatelessWidget {
  final GdSymbol symbol;
  const GdSymbolDetailsPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text(symbol.name.tr()), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SymbolImageCard(symbol: symbol, height: screenHeight * 0.45),
            const SizedBox(height: 24),
            SymbolDatumBadge(symbol: symbol),
            const SizedBox(height: 24),
            Text(
              symbol.description.tr(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

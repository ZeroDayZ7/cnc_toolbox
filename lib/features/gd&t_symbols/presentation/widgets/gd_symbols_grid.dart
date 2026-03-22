import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/data/symbols_data.dart';
import 'package:flutter/material.dart';

import 'gd_symbol_card.dart';

class GdSymbolsGrid extends StatelessWidget {
  const GdSymbolsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSpacings.edgeInsetsM,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.start,
          children: gdSymbolsList
              .map(
                (s) => SizedBox(
                  width: 120,
                  height: 120,
                  child: GdSymbolCard(s: s),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

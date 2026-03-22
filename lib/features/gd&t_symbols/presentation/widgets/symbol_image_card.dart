import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SymbolImageCard extends StatelessWidget {
  final GdSymbol symbol;
  final double height;

  const SymbolImageCard({
    super.key,
    required this.symbol,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: symbol.assetImage != null
            ? InteractiveViewer(
                clipBehavior: Clip.none,
                maxScale: 4.0,
                child: Image.asset(
                  symbol.assetImage!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, _, _) => _buildFallback(context),
                ),
              )
            : _buildFallback(context),
      ),
    );
  }

  Widget _buildFallback(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        symbol.symbol,
        height: 100,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

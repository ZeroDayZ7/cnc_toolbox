import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/data/symbols_data.dart';
import 'package:cnc_toolbox/features/gd&t_symbols/widgets/gd_symbols_info_modal.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GdSymbolsPage extends StatelessWidget {
  const GdSymbolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CncAppBar(
        titleKey: LocaleKeys.gd_symbols_title,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: LocaleKeys.gd_symbols_modal_title.tr(),
            onPressed: () => GdSymbolsInfoModal.show(context),
          ),
        ],
      ),
      body: _buildAllSymbolsGrid(context),
    );
  }

  Widget _buildAllSymbolsGrid(BuildContext context) {
    return Padding(
      padding: AppSpacings.edgeInsetsM,
      child: GridView.builder(
        itemCount: gdSymbolsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final s = gdSymbolsList[index];
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => GdSymbolDetailsRoute($extra: s.name).push(context),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 42,
                    width: 42,
                    child: SvgPicture.asset(
                      s.symbol,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                      placeholderBuilder: (context) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.name.tr(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

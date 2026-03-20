import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart'; // Dodaj ten import
import 'package:cnc_toolbox/features/converter/application/converter_settings_provider.dart';
import 'package:cnc_toolbox/features/converter/data/units_data.dart';
import 'package:cnc_toolbox/features/converter/widgets/converter_inputs.dart';
import 'package:cnc_toolbox/features/converter/widgets/converter_sidebar.dart';
import 'package:cnc_toolbox/features/converter/widgets/settings_sheet.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:easy_localization/easy_localization.dart'; // Do tłumaczenia klucza
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConverterPage extends ConsumerStatefulWidget {
  const ConverterPage({super.key});

  @override
  ConsumerState<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends ConsumerState<ConverterPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final currentCat = converterCategories[_selectedIndex];
    final visibleUnits = settings.getVisibleUnitsForCategory(currentCat);

    return AppScaffold(
      title: Text(LocaleKeys.tools_unit_converter.tr()),
      actions: [
        IconButton(
          icon: const Icon(Icons.tune),
          onPressed: () =>
              SettingsSheet.show(context, currentCat.id.name, currentCat.units),
        ),
      ],

      size: ContainerSize.full,
      scrollable:
          false,
      child: Row(
        children: [
          ConverterSidebar(
            isExpanded: settings.isSidebarExpanded,
            selectedIndex: _selectedIndex,
            categories: converterCategories,
            onSelect: (index) => setState(() => _selectedIndex = index),
            onToggle: () => ref.read(settingsProvider.notifier).toggleSidebar(),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: ConverterInputs(units: visibleUnits, category: currentCat),
          ),
        ],
      ),
    );
  }
}

import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/application/converter_settings_provider.dart';
import 'package:cnc_toolbox/features/converter/data/units_data.dart';
import 'package:cnc_toolbox/features/converter/widgets/converter_inputs.dart';
import 'package:cnc_toolbox/features/converter/widgets/converter_sidebar.dart';
import 'package:cnc_toolbox/features/converter/widgets/settings_sheet.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConverterPage extends ConsumerStatefulWidget {
  const ConverterPage({super.key});

  @override
  ConsumerState<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends ConsumerState<ConverterPage> {
  int _selectedIndex = 0;
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    // Używamy danych z repozytorium
    final currentCat = converterCategories[_selectedIndex];
    final categoryId = currentCat.id;
    final units = currentCat.units;

    final visibleUnits = units
        .where((u) => settings.isUnitVisible(categoryId, u.id))
        .toList();

    return Scaffold(
      appBar: CncAppBar(
        titleKey: LocaleKeys.tools_unit_converter,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) =>
                    SettingsSheet(categoryId: categoryId, units: units),
              );
            },
          ),
        ],
      ),
      body: Row(
        children: [
          ConverterSidebar(
            isExpanded: settings.isSidebarExpanded,
            selectedIndex: _selectedIndex,
            categories: converterCategories,
            onSelect: (index) {
              setState(() {
                _selectedIndex = index;
                _controllers.clear();
              });
            },
            onToggle: () {
              ref.read(settingsProvider.notifier).toggleSidebar();
            },
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: ConverterInputs(
              units: visibleUnits,
              controllers: _controllers,
              categoryId: categoryId,
            ),
          ),
        ],
      ),
    );
  }
}

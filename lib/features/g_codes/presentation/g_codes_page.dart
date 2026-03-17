import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/g_codes/data/g_codes_data.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_code_tile.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_codes_info_modal.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GCodesPage extends StatefulWidget {
  const GCodesPage({super.key});

  @override
  State<GCodesPage> createState() => _GCodesPageState();
}

class _GCodesPageState extends State<GCodesPage> {
  String _query = "";

  List filteredCodes() {
    if (_query.isEmpty) return cncCodes;

    final q = _query.toLowerCase();

    return cncCodes.where((code) {
      return code.code.toLowerCase().contains(q) ||
          code.titleKey.tr().toLowerCase().contains(q) ||
          code.descriptionKey.tr().toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final codes = filteredCodes();

    return Scaffold(
      appBar: CncAppBar(
        titleKey: LocaleKeys.tools_g_codes,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => GCodesInfoModal.show(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),

          Expanded(
            child: ListView.builder(
              itemCount: codes.length,
              itemBuilder: (context, index) {
                return GCodeTile(code: codes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: SearchBar(
        hintText: LocaleKeys.search_hint.tr(),
        leading: const Icon(Icons.search),
        onChanged: (value) {
          setState(() {
            _query = value;
          });
        },
      ),
    );
  }
}

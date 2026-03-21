import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/g_codes/application/g_codes_controller.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_code_tile.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_codes_info_modal.dart';
import 'package:cnc_toolbox/features/g_codes/presentation/widgets/g_codes_search_bar.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GCodesPage extends ConsumerWidget {
  const GCodesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Słuchamy całego stanu z nowego kontrolera
    final state = ref.watch(gCodeControllerProvider);

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
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            ) 
          : Column(
              children: [
                const GCodeSearchBar(),
                Expanded(
                  child: state.filteredCodes.isEmpty
                      ? Center(child: Text(LocaleKeys.error_no_results.tr()))
                      : ListView.builder(
                          itemCount: state.filteredCodes.length,
                          itemBuilder: (context, index) =>
                              GCodeTile(code: state.filteredCodes[index]),
                        ),
                ),
              ],
            ),
    );
  }
}

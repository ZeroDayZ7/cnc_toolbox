import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/g_codes/application/g_codes_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GCodeSearchBar extends ConsumerWidget {
  const GCodeSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: SearchBar(
        hintText: LocaleKeys.search_hint.tr(),
        leading: const Icon(Icons.search),
        onChanged: (value) {
          ref.read(gCodeControllerProvider.notifier).updateSearch(value);
        },
      ),
    );
  }
}

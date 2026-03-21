import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/widgets/info_components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GCodesInfoModal {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                LocaleKeys.g_codes_info_title.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacings.gapM,
              Text(
                LocaleKeys.g_codes_info_description.tr(),
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              InfoSection(
                title: LocaleKeys.g_codes_info_how_it_works_title.tr(),
                content: LocaleKeys.g_codes_info_how_it_works_content.tr(),
              ),
              const SizedBox(height: 20),
              InfoSection(
                title: LocaleKeys.g_codes_info_structure_title.tr(),
                content: LocaleKeys.g_codes_info_structure_content.tr(),
              ),
              const SizedBox(height: 20),
              InfoSection(
                title: LocaleKeys.g_codes_info_modal_codes_title.tr(),
                content: LocaleKeys.g_codes_info_modal_codes_content.tr(),
              ),
              const SizedBox(height: 20),
              InfoTipCard(text: LocaleKeys.g_codes_info_safety_tip.tr()),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () => Navigator.pop(context),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacings.m),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(LocaleKeys.common_understand.tr()),
                ),
              ),
              AppSpacings.gapM,
            ],
          ),
        ),
      ),
    );
  }
}

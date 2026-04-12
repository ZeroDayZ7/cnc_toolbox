import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/presentation/history_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedRateActions extends ConsumerWidget {
  const FeedRateActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.history),
          tooltip: LocaleKeys.feed_rate_history_tooltip.tr(),
          onPressed: () {
            final tabIndex = DefaultTabController.of(context).index;
            final type = tabIndex == 0 ? FeedType.basic : FeedType.arc;
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => HistorySheet(targetType: type),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.save),
          tooltip: LocaleKeys.feed_rate_save_params_tooltip.tr(),
          onPressed: () async {
            final tabIndex = DefaultTabController.of(context).index;
            final type = tabIndex == 0 ? FeedType.basic : FeedType.arc;
            await ref.read(feedRateProvider(type).notifier).save();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    LocaleKeys.feed_rate_save_success.tr(
                      args: [type.toString()],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

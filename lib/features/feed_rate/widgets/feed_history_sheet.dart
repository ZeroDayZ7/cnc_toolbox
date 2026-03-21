import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/history/domain/history_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedHistorySheet extends ConsumerWidget {
  final FeedType targetType;

  const FeedHistorySheet({super.key, required this.targetType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Słuchamy stanu z Notifiera (używając DTO)
    final historyState = ref.watch(historyProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return historyState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text("Błąd: $err")),
          data: (history) => Column(
            children: [
              Padding(
                padding: AppSpacings.edgeInsetsM,
                child: Text(
                  LocaleKeys.common_history.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: history.isEmpty
                    ? Center(child: Text(LocaleKeys.common_no_data.tr()))
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          final item = history[index];
                          return ListTile(
                            leading: const Icon(Icons.history),
                            title: Text("${item.vf.toStringAsFixed(1)} mm/min"),
                            subtitle: Text(
                              "n: ${item.n}, fz: ${item.fz}, z: ${item.z}",
                            ),
                            onTap: () {
                              // Tutaj ładujemy dane z powrotem do kalkulatora
                              ref
                                  .read(feedRateProvider(targetType).notifier)
                                  .loadFromHistory(
                                    item,
                                  );
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

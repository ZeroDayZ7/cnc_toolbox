import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedHistorySheet extends ConsumerWidget {
  final String targetType;

  const FeedHistorySheet({super.key, required this.targetType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.read(databaseProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return FutureBuilder(
          future: db.getFeedHistory(limit: 10),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final history = snapshot.data!;

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Ostatnie obliczenia",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: history.isEmpty
                      ? const Center(child: Text("Brak danych"))
                      : ListView.builder(
                          controller: scrollController,
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            final item = history[index];
                            return ListTile(
                              leading: const Icon(Icons.history),
                              title: Text(
                                "${item.resultVf.toStringAsFixed(1)} mm/min",
                              ),
                              subtitle: Text(
                                "n: ${item.spindleSpeed}, fz: ${item.feedPerTooth}, z: ${item.teeth}",
                              ),
                              onTap: () {
                                ref
                                    .read(feedRateProvider(targetType).notifier)
                                    .loadFromHistory(item);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

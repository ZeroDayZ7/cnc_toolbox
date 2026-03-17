
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feed_input_fields.dart';
import 'result_card.dart';

class FeedRateForm extends ConsumerWidget {
  final String type;

  const FeedRateForm({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedRateProvider(type));
    final notifier = ref.read(feedRateProvider(type).notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ResultCard(
            vf: type == "basic" ? state.resultVf : state.resultVfArc,
            f: state.resultF,
            isArc: type == "arc",
          ),
          const SizedBox(height: 20),
          FeedInputFields(notifier: notifier),
          if (type == "arc") ...[
            const Divider(height: 40),
            const Text(
              "Parametry łuku",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Średnica narzędzia (D)",
                border: OutlineInputBorder(),
              ),
              onChanged: notifier.updateToolDia,
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Średnica otworu/czopu",
                border: OutlineInputBorder(),
              ),
              onChanged: notifier.updateFeatureDia,
            ),
            SwitchListTile(
              title: Text(
                state.isInternal ? "Otwór (Wewnętrzny)" : "Czop (Zewnętrzny)",
              ),
              value: state.isInternal,
              onChanged: notifier.toggleWorkType,
            ),
          ],
        ],
      ),
    );
  }
}

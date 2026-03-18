import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart'; // Dodaj import enuma
import 'package:cnc_toolbox/widgets/custom_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feed_input_fields.dart';
import 'result_card.dart';

class FeedRateForm extends ConsumerStatefulWidget {
  final FeedType type; // Zmieniono z String na FeedType
  const FeedRateForm({super.key, required this.type});

  @override
  ConsumerState<FeedRateForm> createState() => _FeedRateFormState();
}

class _FeedRateFormState extends ConsumerState<FeedRateForm> {
  late final TextEditingController _nController;
  late final TextEditingController _zController;
  late final TextEditingController _fzController;
  late final TextEditingController _toolDiaController;
  late final TextEditingController _featDiaController;

  @override
  void initState() {
    super.initState();
    final s = ref.read(feedRateProvider(widget.type));
    _nController = TextEditingController(text: _fmt(s.spindleSpeed));
    _zController = TextEditingController(text: s.numberOfTeeth.toString());
    _fzController = TextEditingController(text: _fmt(s.feedPerTooth));
    _toolDiaController = TextEditingController(text: _fmt(s.toolDiameter));
    _featDiaController = TextEditingController(text: _fmt(s.featureDiameter));
  }

  String _fmt(double val) => val > 0 ? AppNumberFormatter.format(val) : "";

  @override
  void dispose() {
    _nController.dispose();
    _zController.dispose();
    _fzController.dispose();
    _toolDiaController.dispose();
    _featDiaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(feedRateProvider(widget.type));
    final notifier = ref.read(feedRateProvider(widget.type).notifier);

    _updateIfChanged(_nController, state.spindleSpeed);
    _updateIfChanged(_zController, state.numberOfTeeth.toDouble());
    _updateIfChanged(_fzController, state.feedPerTooth);
    _updateIfChanged(_toolDiaController, state.toolDiameter);
    _updateIfChanged(_featDiaController, state.featureDiameter);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ResultCard(
            vf: widget.type == FeedType.basic
                ? state.resultVf
                : state.resultVfArc,
            f: state.resultF,
            isArc: widget.type == FeedType.arc,
          ),
          const SizedBox(height: 20),
          FeedInputFields(
            notifier: notifier,
            nController: _nController,
            zController: _zController,
            fzController: _fzController,
          ),
          // Warunek oparty na enumie
          if (widget.type == FeedType.arc) ...[
            const Divider(height: 40),
            Text(LocaleKeys.feed_rate_arc_parameters.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CustomField(
              label: LocaleKeys.feed_rate_tool_diameter_label.tr(),
              suffix: "mm",
              controller: _toolDiaController,
              onChanged: notifier.updateToolDia,
            ),
            const SizedBox(height: 10),
            CustomField(
              label: LocaleKeys.feed_rate_feature_diameter_label.tr(),
              suffix: "mm",
              controller: _featDiaController,
              onChanged: notifier.updateFeatureDia,
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: Text(
                state.isInternal
                    ? LocaleKeys.feed_rate_internal_work.tr()
                    : LocaleKeys.feed_rate_external_work.tr(),
              ),
              value: state.isInternal,
              onChanged: (val) => notifier.toggleWorkType(val),
            ),
          ],
        ],
      ),
    );
  }

  void _updateIfChanged(TextEditingController controller, double value) {
    final text = value > 0 ? AppNumberFormatter.format(value) : "";
    if (controller.text != text && !FocusScope.of(context).hasFocus) {
      controller.text = text;
    }
  }
}

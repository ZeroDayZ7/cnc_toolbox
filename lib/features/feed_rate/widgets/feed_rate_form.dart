import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_computed.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/widgets/custom_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'feed_input_fields.dart';
import 'result_card.dart';

class FeedRateForm extends HookConsumerWidget {
  final FeedType type;
  const FeedRateForm({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedRateProvider(type));
    final vf = ref.watch(feedRateVfProvider(type));
    final avf = ref.watch(adjustedFeedRateProvider(type));
    final f = ref.watch(feedRateFProvider(type));

    final nController = useTextEditingController(
      text: _fmt(state.spindleSpeed),
    );
    final zController = useTextEditingController(
      text: state.numberOfTeeth.toString(),
    );
    final fzController = useTextEditingController(
      text: _fmt(state.feedPerTooth),
    );
    final toolDiaController = useTextEditingController(
      text: _fmt(state.toolDiameter),
    );
    final featDiaController = useTextEditingController(
      text: _fmt(state.featureDiameter),
    );

    final hasFocus = FocusScope.of(context).hasFocus;

    useEffect(() {
      if (!hasFocus) {
        _syncIfChanged(nController, state.spindleSpeed);
        _syncIfChanged(zController, state.numberOfTeeth.toDouble());
        _syncIfChanged(fzController, state.feedPerTooth);
        _syncIfChanged(toolDiaController, state.toolDiameter);
        _syncIfChanged(featDiaController, state.featureDiameter);
      }
      return null;
    }, [state, hasFocus]);

    return SingleChildScrollView(
      padding: AppSpacings.edgeInsetsM,
      child: Column(
        children: [
          ResultCard(
            vf: type == FeedType.arc ? avf : vf,
            f: f,
            isArc: type == FeedType.arc,
          ),
          const SizedBox(height: 20),
          FeedInputFields(
            type: type,
            nController: nController,
            zController: zController,
            fzController: fzController,
          ),
          if (type == FeedType.arc) ...[
            const Divider(height: 40),
            _buildArcSection(
              context,
              ref,
              state,
              type,
              toolDiaController,
              featDiaController,
            ),
          ],
        ],
      ),
    );
  }

  String _fmt(double val) => val > 0 ? AppNumberFormatter.format(val) : "";

  void _syncIfChanged(TextEditingController controller, double value) {
    final text = _fmt(value);
    if (controller.text != text) controller.text = text;
  }

  Widget _buildArcSection(
    BuildContext context,
    WidgetRef ref,
    FeedRateState state,
    FeedType type,
    TextEditingController dCtrl,
    TextEditingController dfCtrl,
  ) {
    final notifier = ref.read(feedRateProvider(type).notifier);

    return Column(
      children: [
        Text(
          LocaleKeys.feed_rate_arc_parameters.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomField(
          label: LocaleKeys.feed_rate_tool_diameter_label.tr(),
          suffix: "mm",
          controller: dCtrl,
          onChanged: (v) {
            final val = AppNumberFormatter.tryParse(v);
            if (val != null) notifier.updateToolDia(val);
          },
        ),
        const SizedBox(height: 10),
        CustomField(
          label: LocaleKeys.feed_rate_feature_diameter_label.tr(),
          suffix: "mm",
          controller: dfCtrl,
          onChanged: (v) {
            final val = AppNumberFormatter.tryParse(v);
            if (val != null) notifier.updateFeatureDia(val);
          },
        ),
        const SizedBox(height: 10),
        SwitchListTile(
          title: Text(
            state.isInternal
                ? LocaleKeys.feed_rate_internal_work.tr()
                : LocaleKeys.feed_rate_external_work.tr(),
          ),
          value: state.isInternal,
          onChanged: notifier.toggleWorkType,
        ),
      ],
    );
  }
}

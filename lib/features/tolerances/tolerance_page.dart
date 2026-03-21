import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_controller.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_provider.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:cnc_toolbox/features/tolerances/widgets/tolerance_input_form.dart';
import 'package:cnc_toolbox/features/tolerances/widgets/tolerance_result_display.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TolerancePage extends ConsumerWidget {
  const TolerancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceAsync = ref.watch(toleranceServiceProvider);
    // Słuchamy stanu z kontrolera
    final ctrl = ref.watch(toleranceControllerProvider);
    final notifier = ref.read(toleranceControllerProvider.notifier);

    return Scaffold(
      appBar: const CncAppBar(titleKey: LocaleKeys.tools_tolerances),
      body: serviceAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(err.toString())),
        data: (_) => SingleChildScrollView(
          padding: AppSpacings.edgeInsetsM,
          child: Column(
            children: [
              SegmentedButton<ToleranceType>(
                segments: [
                  ButtonSegment(
                    value: ToleranceType.hole,
                    label: Text(LocaleKeys.tolerance_hole.tr()),
                    icon: const Icon(Icons.circle_outlined),
                  ),
                  ButtonSegment(
                    value: ToleranceType.shaft,
                    label: Text(LocaleKeys.tolerance_shaft.tr()),
                    icon: const Icon(Icons.panorama_fish_eye),
                  ),
                ],
                selected: {ctrl.type},
                onSelectionChanged: (set) => notifier.updateType(set.first),
              ),
              AppSpacings.gapM,
              ToleranceInputForm(
                // Przekazujemy wartości ze stanu i callbacki do notifiera
                diameterInitialValue: ctrl.diameterInput,
                selectedType: ctrl.type,
                selectedLetter: ctrl.selectedLetter,
                selectedNumber: ctrl.selectedNumber,
                letters: ctrl.availableLetters,
                numbers: ctrl.availableNumbers,
                onDiameterChanged: notifier.updateDiameter,
                onLetterChanged: notifier.updateLetter,
                onNumberChanged: notifier.updateNumber,
              ),
              const SizedBox(height: 24),
              if (ctrl.result != null)
                ToleranceResultDisplay(res: ctrl.result!),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToleranceInputForm extends StatelessWidget {
  final String diameterInitialValue;
  final ToleranceType selectedType;
  final String? selectedLetter;
  final String? selectedNumber;
  final ValueChanged<String> onDiameterChanged;
  final ValueChanged<String?> onLetterChanged;
  final ValueChanged<String?> onNumberChanged;
  final List<String> letters;
  final List<String> numbers;

  const ToleranceInputForm({
    super.key,
    required this.diameterInitialValue,
    required this.selectedType,
    required this.selectedLetter,
    required this.selectedNumber,
    required this.onDiameterChanged,
    required this.onLetterChanged,
    required this.onNumberChanged,
    required this.letters,
    required this.numbers,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: Padding(
        padding: AppSpacings.edgeInsetsM,
        child: Column(
          children: [
            TextFormField(
              initialValue: diameterInitialValue,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: LocaleKeys.tolerance_nominal_diameter.tr(),
                suffixText: LocaleKeys.tolerance_unit_mm.tr(),
                prefixIcon: const Icon(Icons.straighten),
              ),
              onChanged: onDiameterChanged,
            ),
            AppSpacings.gapM,
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    key: ValueKey('letter_${selectedType}_$selectedLetter'),
                    initialValue: selectedLetter,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.tolerance_letter.tr(),
                    ),
                    items: letters
                        .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                        .toList(),
                    onChanged: onLetterChanged,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    key: ValueKey('number_${selectedLetter}_$selectedNumber'),
                    initialValue: selectedNumber,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.tolerance_grade_number.tr(),
                    ),
                    items: numbers
                        .map((n) => DropdownMenuItem(value: n, child: Text(n)))
                        .toList(),
                    onChanged: onNumberChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_provider.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_service.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:cnc_toolbox/features/tolerances/widgets/tolerance_input_form.dart';
import 'package:cnc_toolbox/features/tolerances/widgets/tolerance_result_display.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TolerancePage extends ConsumerStatefulWidget {
  const TolerancePage({super.key});

  @override
  ConsumerState<TolerancePage> createState() => _TolerancePageState();
}

class _TolerancePageState extends ConsumerState<TolerancePage> {
  final TextEditingController _diameterController = TextEditingController();
  ToleranceType _selectedType = ToleranceType.hole;
  String? _selectedLetter;
  String? _selectedNumber;
  ToleranceResult? _result;

  @override
  void dispose() {
    _diameterController.dispose();
    super.dispose();
  }

  void _initDefaults(ToleranceService service) {
    if (_selectedLetter != null) return;
    final letters = service.getLetters(_selectedType);
    if (letters.isEmpty) return;

    _selectedLetter = letters.contains('H')
        ? 'H'
        : (letters.contains('h') ? 'h' : letters.first);
    _updateNumbersAndCalculate(service);
  }

  void _updateNumbersAndCalculate(ToleranceService service) {
    final numbers = service.getNumbersForLetter(
      _selectedType,
      _selectedLetter!,
    );
    if (numbers.isEmpty) return;

    _selectedNumber = numbers.contains('7') ? '7' : numbers.first;
    _calculate(service);
  }

  void _calculate(ToleranceService service) {
    final diameter = double.tryParse(_diameterController.text);
    if (diameter == null ||
        _selectedLetter == null ||
        _selectedNumber == null) {
      setState(() => _result = null);
      return;
    }
    setState(() {
      _result = service.calculate(
        diameter,
        _selectedLetter!,
        _selectedNumber!,
        _selectedType,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final serviceAsync = ref.watch(toleranceServiceProvider);

    return Scaffold(
      appBar: const CncAppBar(titleKey: LocaleKeys.tools_tolerances),
      body: serviceAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(err.toString())),
        data: (service) {
          _initDefaults(service);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
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
                  selected: {_selectedType},
                  onSelectionChanged: (newSelection) => setState(() {
                    _selectedType = newSelection.first;
                    _selectedLetter = null;
                    _initDefaults(service);
                  }),
                ),
                const SizedBox(height: 16),
                ToleranceInputForm(
                  diameterController: _diameterController,
                  selectedType: _selectedType,
                  selectedLetter: _selectedLetter,
                  selectedNumber: _selectedNumber,
                  onChanged: () => _calculate(service),
                  onLetterChanged: (val) => setState(() {
                    _selectedLetter = val;
                    _updateNumbersAndCalculate(service);
                  }),
                  onNumberChanged: (val) => setState(() {
                    _selectedNumber = val;
                    _calculate(service);
                  }),
                  letters: service.getLetters(_selectedType),
                  numbers: _selectedLetter != null
                      ? service.getNumbersForLetter(
                          _selectedType,
                          _selectedLetter!,
                        )
                      : [],
                ),
                const SizedBox(height: 24),
                if (_result != null) ToleranceResultDisplay(res: _result!),
              ],
            ),
          );
        },
      ),
    );
  }
}

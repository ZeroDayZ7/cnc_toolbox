import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'tolerance_service.dart';
import 'widgets/tolerance_input_form.dart';
import 'widgets/tolerance_result_display.dart';

class TolerancePage extends StatefulWidget {
  const TolerancePage({super.key});

  @override
  State<TolerancePage> createState() => _TolerancePageState();
}

class _TolerancePageState extends State<TolerancePage> {
  final TextEditingController _diameterController = TextEditingController();
  ToleranceType _selectedType = ToleranceType.hole;
  String? _selectedLetter;
  String? _selectedNumber;
  ToleranceResult? _result;

  @override
  void initState() {
    super.initState();
    _resetToDefaults();
  }

  void _resetToDefaults() {
    final letters = ToleranceService.getLetters(_selectedType);
    _selectedLetter = letters.contains('H')
        ? 'H'
        : (letters.contains('h') ? 'h' : letters.first);
    _updateNumbersAndCalculate();
  }

  void _updateNumbersAndCalculate() {
    final numbers = ToleranceService.getNumbersForLetter(
      _selectedType,
      _selectedLetter!,
    );
    _selectedNumber = numbers.contains('7') ? '7' : numbers.first;
    _calculate();
  }

  void _calculate() {
    final diameter = double.tryParse(_diameterController.text);
    if (diameter == null ||
        _selectedLetter == null ||
        _selectedNumber == null) {
      setState(() => _result = null);
      return;
    }
    setState(() {
      _result = ToleranceService.calculate(
        diameter,
        _selectedLetter!,
        _selectedNumber!,
        _selectedType,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CncAppBar(titleKey: LocaleKeys.tools_tolerances.tr()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTypeSelector(),
            const SizedBox(height: 16),
            ToleranceInputForm(
              diameterController: _diameterController,
              selectedType: _selectedType,
              selectedLetter: _selectedLetter,
              selectedNumber: _selectedNumber,
              onChanged: _calculate,
              onLetterChanged: (val) => setState(() {
                _selectedLetter = val;
                _updateNumbersAndCalculate();
              }),
              onNumberChanged: (val) => setState(() {
                _selectedNumber = val;
                _calculate();
              }),
            ),
            const SizedBox(height: 24),
            if (_result != null) ToleranceResultDisplay(res: _result!),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    return SegmentedButton<ToleranceType>(
      segments: [
        ButtonSegment(
          value: ToleranceType.hole,
          label: Text(LocaleKeys.tolerance_hole.tr()),
          icon: Icon(Icons.circle_outlined),
        ),
        ButtonSegment(
          value: ToleranceType.shaft,
          label: Text(LocaleKeys.tolerance_shaft.tr()),
          icon: Icon(Icons.panorama_fish_eye),
        ),
      ],
      selected: {_selectedType},
      onSelectionChanged: (newSelection) => setState(() {
        _selectedType = newSelection.first;
        _resetToDefaults();
      }),
    );
  }
}

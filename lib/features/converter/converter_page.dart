import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final TextEditingController _inputController = TextEditingController();
  String _fromUnit = 'mm';
  String _toUnit = 'inch';
  double _result = 0.0;

  final Map<String, List<String>> _unitCategories = {
    'length': ['mm', 'cm', 'm', 'inch', 'ft'],
    'speed': ['m/min', 'ft/min'],
    'feed': ['mm/min', 'mm/rev', 'inch/min'],
    'rpm': ['RPM', 'Hz'],
  };

  List<String> get _currentUnits => _unitCategories['length']!;

  void _convert() {
    final value = double.tryParse(_inputController.text);
    if (value == null) return;

    double res = value;

    // PROSTY PRZYKŁAD konwersji długości
    if (_fromUnit == _toUnit) {
      res = value;
    } else if (_fromUnit == 'mm' && _toUnit == 'inch') {
      res = value / 25.4;
    } else if (_fromUnit == 'inch' && _toUnit == 'mm') {
      res = value * 25.4;
    }
    // inne konwersje można dodać analogicznie

    setState(() {
      _result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.tools_unit_converter.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: LocaleKeys.converter_input.tr(),
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => _convert(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildDropdown(from: true)),
                const SizedBox(width: 12),
                const Icon(Icons.arrow_forward),
                const SizedBox(width: 12),
                Expanded(child: _buildDropdown(from: false)),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '${LocaleKeys.converter_result.tr()}: $_result $_toUnit',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({required bool from}) {
    final selected = from ? _fromUnit : _toUnit;
    return DropdownButtonFormField<String>(
      initialValue: selected,
      decoration: InputDecoration(
        labelText: from
            ? LocaleKeys.converter_from.tr()
            : LocaleKeys.converter_to.tr(),
        border: const OutlineInputBorder(),
      ),
      items: _currentUnits
          .map((u) => DropdownMenuItem(value: u, child: Text(u)))
          .toList(),
      onChanged: (val) {
        if (val == null) return;
        setState(() {
          if (from)
            _fromUnit = val;
          else
            _toUnit = val;
          _convert();
        });
      },
    );
  }
}

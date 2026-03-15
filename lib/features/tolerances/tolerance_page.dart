import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'tolerance_service.dart';

class TolerancePage extends StatefulWidget {
  const TolerancePage({super.key});

  @override
  State<TolerancePage> createState() => _TolerancePageState();
}

class _TolerancePageState extends State<TolerancePage> {
  final _diameterController = TextEditingController();
  String _selectedGrade = 'H7';
  Map<String, double>? _result;

  void _calculate() {
    final d = double.tryParse(_diameterController.text);
    if (d != null) {
      setState(() {
        _result = ToleranceService.calculate(d, _selectedGrade);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tools.tolerances'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _diameterController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'tolerance.diameter'.tr(),
                        suffixText: 'mm',
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (_) => _calculate(),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'tolerance.grade'.tr(),
                        border: const OutlineInputBorder(),
                      ),
                      items: ToleranceService.getAvailableGrades()
                          .map(
                            (g) => DropdownMenuItem(value: g, child: Text(g)),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() => _selectedGrade = val!);
                        _calculate();
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_result != null) ...[
              _buildResultTile(
                'tolerance.upper_dev'.tr(),
                '${_result!['upper']!.toStringAsFixed(3)} mm',
                Colors.green,
              ),
              _buildResultTile(
                'tolerance.lower_dev'.tr(),
                '${_result!['lower']!.toStringAsFixed(3)} mm',
                Colors.red,
              ),
              const Divider(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'tolerance.result_range'.tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Ø${_result!['min']!.toStringAsFixed(3)} ÷ Ø${_result!['max']!.toStringAsFixed(3)}',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ] else if (_diameterController.text.isNotEmpty)
              Center(child: Text('error.out_of_range'.tr())),
          ],
        ),
      ),
    );
  }

  Widget _buildResultTile(String label, String value, Color color) {
    return ListTile(
      title: Text(label),
      trailing: Text(
        value,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

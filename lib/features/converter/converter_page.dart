import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/features/converter/application/converter_provider.dart';
import 'package:cnc_toolbox/features/converter/data/units_repository.dart'; // Tu masz lengthUnits itd.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConverterPage extends ConsumerStatefulWidget {
  const ConverterPage({super.key});

  @override
  ConsumerState<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends ConsumerState<ConverterPage> {
  bool _isExpanded = true;
  int _selectedIndex = 0;

  // Mapa kategorii dla łatwego dostępu
  final List<Map<String, dynamic>> _categories = [
    {
      'id': 'length',
      'icon': Icons.straighten,
      'label': 'Długość',
      'units': lengthUnits,
    },
    {
      'id': 'temp',
      'icon': Icons.thermostat,
      'label': 'Temperatura',
      'units': [],
    }, // Do uzupełnienia
    {'id': 'speed', 'icon': Icons.speed, 'label': 'Prędkość', 'units': []},
    {
      'id': 'pressure',
      'icon': Icons.compress,
      'label': 'Ciśnienie',
      'units': [],
    },
  ];

  // Mapa kontrolerów, aby nie tworzyć ich co render (zapobiega gubieniu fokusu)
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentCat = _categories[_selectedIndex];
    final String categoryId = (currentCat['id'] as String?) ?? 'length';
    final List units = (currentCat['units'] as List?) ?? [];

    final state = ref.watch(converterProvider(categoryId));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Konwerter"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(Routes.home),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              // Tu otworzysz SettingsSheet
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // LEWY PANEL - dopasowany do najdłuższego tekstu
          Container(
            width: _isExpanded ? 200 : 70,
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(_isExpanded ? Icons.menu_open : Icons.menu),
                  onPressed: () => setState(() => _isExpanded = !_isExpanded),
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: ListView.builder(
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final cat = _categories[index];
                      final isSelected = index == _selectedIndex;

                      return InkWell(
                        onTap: () => setState(() {
                          _selectedIndex = index;
                          _controllers.clear();
                        }),
                        borderRadius: BorderRadius.circular(8),
                        child: ClipRect(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: _isExpanded ? 12 : 0,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.primary.withValues(alpha: 0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: _isExpanded
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              children: [
                                Tooltip(
                                  message: !_isExpanded ? cat['label'] : '',
                                  child: Icon(
                                    cat['icon'],
                                    size: 22,
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : null,
                                  ),
                                ),
                                if (_isExpanded)
                                  Expanded(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      transitionBuilder: (child, animation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: SlideTransition(
                                            position: Tween<Offset>(
                                              begin: const Offset(0.1, 0),
                                              end: Offset.zero,
                                            ).animate(animation),
                                            child: child,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        key: const ValueKey('expanded'),
                                        children: [
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              cat['label'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: isSelected
                                                    ? Theme.of(
                                                        context,
                                                      ).colorScheme.primary
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const VerticalDivider(thickness: 1, width: 1),

          // PRAWY PANEL (INPUTY)
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: units.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final unit = units[index];
                final value = state.values[unit.id] ?? "";

                // Inicjalizacja kontrolera jeśli nie istnieje
                final controller = _controllers.putIfAbsent(
                  unit.id,
                  () => TextEditingController(),
                );

                // Aktualizacja tekstu tylko jeśli jest inny (zapobiega skakaniu kursora)
                if (controller.text != value) {
                  controller.value = controller.value.copyWith(
                    text: value,
                    selection: TextSelection.collapsed(offset: value.length),
                  );
                }

                return TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: unit.label,
                    suffixText: unit.symbol,
                    suffixStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (val) {
                    ref
                        .read(converterProvider(categoryId).notifier)
                        .updateValue(unit.id, val, units.cast());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConverterSidebar extends StatelessWidget {
  final bool isExpanded;
  final int selectedIndex;
  final List<ConverterCategory> categories;
  final Function(int) onSelect;
  final VoidCallback onToggle;

  const ConverterSidebar({
    super.key,
    required this.isExpanded,
    required this.selectedIndex,
    required this.categories,
    required this.onSelect,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOutCubic,
      width: isExpanded ? 200 : 72,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor.withAlpha(50),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          IconButton(
            icon: AnimatedRotation(
              duration: const Duration(milliseconds: 250),
              turns: isExpanded ? 0 : 0.5,
              child: Icon(isExpanded ? Icons.menu_open : Icons.menu),
            ),
            onPressed: onToggle,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = index == selectedIndex;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  child: InkWell(
                    onTap: () => onSelect(index),
                    borderRadius: BorderRadius.circular(12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(30)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        // To zapobiega skakaniu ikon do środka
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppSpacings.gapM, // Stały margines od lewej
                          Icon(
                            cat.icon,
                            size: 24,
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                          ),
                          // Kluczowy element: Płynne pojawianie się tekstu
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: isExpanded ? 1.0 : 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  cat.label.tr(),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                  ),
                                ),
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
    );
  }
}

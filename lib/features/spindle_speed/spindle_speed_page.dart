import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SpindleSpeedPage extends StatelessWidget {
  const SpindleSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      // Tytuł strony (n - Obroty wrzeciona)
      title: Text('Spindle Speed'),

      // Rozmiar narrow idealnie pasuje do formularzy kalkulatorów
      size: ContainerSize.narrow,

      // Placeholder treści
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.speed, size: 64, color: Colors.grey),
            AppSpacings.gapM,
            Text(
              'Spindle Speed Page Placeholder',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

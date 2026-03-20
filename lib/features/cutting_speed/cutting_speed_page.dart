
import 'package:cnc_toolbox/core/theme/app_design.dart'; // import dla ContainerSize
import 'package:cnc_toolbox/widgets/app_scaffold.dart'; // nasz nowy scaffold
import 'package:flutter/material.dart';

class CuttingSpeedPage extends StatelessWidget {
  const CuttingSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Używamy AppScaffold zamiast zwykłego Scaffold
    return const AppScaffold(
      // 1. Tytuł automatycznie obsłuży centerTitle zależnie od platformy
      title: Text('Tap Drill'),

      // 2. Nie przekazujemy parametru 'sidebar'.
      // Dzięki temu Scaffold sam wstawi strzałkę wstecz w AppBarze.

      // 3. Określamy rozmiar kontenera (np. narrow dla prostego placeholderu)
      size: ContainerSize.narrow,

      // 4. Treść strony
      child: Center(child: Text('Tap Drill Page Placeholder')),
    );
  }
}

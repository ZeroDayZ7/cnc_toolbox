import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/symbols_data.dart';

class GdSymbolsPage extends StatelessWidget {
  const GdSymbolsPage({super.key});

  // Funkcja wyświetlająca modal z opisem GD&T
  void _showInfoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                "Czym jest GD&T?",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "GD&T (Geometric Dimensioning and Tolerancing) to system symboli służący do precyzyjnego definiowania dopuszczalnych odchyłek kształtu, osiowości, bicia i położenia elementów na rysunku technicznym.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "W odróżnieniu od zwykłych tolerancji wymiarowych, GD&T pozwala kontrolować geometrię detalu, co jest kluczowe dla poprawnego montażu i działania maszyn. System ten opiera się na tzw. bazach (Datums), które wyznaczają punkty odniesienia dla pomiarów.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Mały przycisk zamknięcia
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Rozumiem"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.gd_symbols_title.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(Routes.home),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: "Co to jest GD&T?",
            onPressed: () => _showInfoModal(context),
          ),
        ],
      ),
      // Tu pokazujemy wszystkie symbole w jednej siatce
      body: _buildAllSymbolsGrid(context),
    );
  }

  Widget _buildAllSymbolsGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: gdSymbolsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        // Usuń shrinkWrap i NeverScrollableScrollPhysics
        physics: const AlwaysScrollableScrollPhysics(),
        // shrinkWrap: false domyślnie
        itemBuilder: (context, index) {
          final s = gdSymbolsList[index];
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => context.push('/gd-symbols/details', extra: s.name),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    s.symbol,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.name.tr(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:flutter/material.dart';

class SpindleSpeedPage extends StatelessWidget {
  const SpindleSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CNC Calculator'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => const HomeRoute().go(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ---------- Sekcja materiał i narzędzie ----------
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Materiał obrabiany',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      items: ['Stal', 'Aluminium', 'Mosiądz', 'Tworzywo']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {},
                      hint: const Text('Wybierz materiał'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Rodzaj narzędzia',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      items: ['Nóż tokarski', 'Frez walcowy', 'Wiertło']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {},
                      hint: const Text('Wybierz narzędzie'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ---------- Sekcja średnica i priorytet ----------
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Średnica obrabianego detalu [mm]',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Np. 50',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Priorytet obliczeń',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceChip(
                          label: const Text('Prędkość skrawania (Vc)'),
                          selected: true,
                          onSelected: (_) {},
                        ),
                        ChoiceChip(
                          label: const Text('Obroty wrzeciona (n)'),
                          selected: false,
                          onSelected: (_) {},
                        ),
                        ChoiceChip(
                          label: const Text('Posuw (f)'),
                          selected: false,
                          onSelected: (_) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ---------- Sekcja wyników ----------
            Card(
              color: Colors.grey[100],
              elevation: 2,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wyniki',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Prędkość skrawania Vc [m/min]:'),
                        Text('---'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Obroty wrzeciona n [obr/min]:'),
                        Text('---'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Posuw f [mm/obr]:'), Text('---')],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // ---------- Przycisk oblicz ----------
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calculate),
              label: const Text('Oblicz'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

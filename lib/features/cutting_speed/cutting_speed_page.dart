import 'package:flutter/material.dart';

class CuttingSpeedPage extends StatelessWidget {
  const CuttingSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cutting Speed')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Cutting Speed Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Input: Diameter
            TextField(
              decoration: InputDecoration(
                labelText: 'Tool Diameter (mm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Input: RPM
            TextField(
              decoration: InputDecoration(
                labelText: 'Spindle RPM',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Button
            ElevatedButton(
              onPressed: () {
                // Tutaj dodamy logikę kalkulacji
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Calculation not implemented yet'),
                  ),
                );
              },
              child: const Text('Calculate Cutting Speed'),
            ),
          ],
        ),
      ),
    );
  }
}

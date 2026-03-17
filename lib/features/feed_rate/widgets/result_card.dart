import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double vf;
  final double f;
  final bool isArc;

  const ResultCard({super.key, required this.vf, required this.f, this.isArc = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isArc ? const Color.fromARGB(255, 0, 92, 95) : Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(isArc ? "Skompensowany posuw (Vf)" : "Posuw liniowy (Vf)"),
          Text("${vf.toStringAsFixed(1)} mm/min", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Text("Na obrót: ${f.toStringAsFixed(3)} mm/obr"),
        ],
      ),
    );
  }
}
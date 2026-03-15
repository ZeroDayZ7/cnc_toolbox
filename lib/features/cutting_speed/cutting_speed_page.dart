import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CuttingSpeedPage extends StatelessWidget {
  const CuttingSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap Drill'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
        ),
      ),
      body: const Center(child: Text('Tap Drill Page Placeholder')),
    );
  }
}

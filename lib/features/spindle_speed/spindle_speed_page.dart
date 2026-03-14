import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpindleSpeedPage extends StatelessWidget {
  const SpindleSpeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spindle Speed'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
        ),
      ),
      body: const Center(child: Text('Spindle Speed Page Placeholder')),
    );
  }
}

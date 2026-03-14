import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedRatePage extends StatelessWidget {
  const FeedRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed Rate'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
        ),
      ),
      body: const Center(child: Text('Feed Rate Page Placeholder')),
    );
  }
}

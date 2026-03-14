import 'package:cnc_toolbox/features/home/tool_tile.dart';
import 'package:cnc_toolbox/features/home/tools_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app.title".tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go("/settings"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 900
                ? 4
                : constraints.maxWidth > 600
                ? 3
                : 2;

            return GridView.builder(
              itemCount: tools.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final tool = tools[index];

                return ToolTile(
                  icon: tool.icon,
                  label: tool.labelKey,
                  description: tool.descriptionKey,
                  onTap: () => context.go(tool.route),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

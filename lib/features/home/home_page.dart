import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/features/home/cnc_drawer.dart';
import 'package:cnc_toolbox/features/home/tool_tile.dart';
import 'package:cnc_toolbox/features/home/tools_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppInfo.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => const SettingsRoute().push(context),
          ),
        ],
      ),
      drawer: const CncDrawer(),
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
                childAspectRatio: 0.90,
              ),
              itemBuilder: (context, index) {
                final tool = tools[index];

                return ToolTile(
                  icon: tool.icon,
                  label: tool.labelKey,
                  description: tool.descriptionKey,
                  onTap: () => tool.route.go(context),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

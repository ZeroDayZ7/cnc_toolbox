import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/home/presentation/widgets/cnc_drawer.dart';
import 'package:cnc_toolbox/features/home/presentation/widgets/tool_tile.dart';
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
        padding: AppSpacings.edgeInsetsM,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              itemCount: appNavigation.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                final tool = appNavigation[index];
                return ToolTile(
                  icon: tool.icon,
                  label: tool.labelKey,
                  description: tool.descriptionKey,
                  onTap: () => tool.navigateTo(context),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/features/home/tools_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CncDrawer extends StatelessWidget {
  const CncDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Nagłówek Drawera
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              border: const Border(
                bottom: BorderSide(color: Colors.blueAccent, width: 2),
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.precision_manufacturing,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(height: 10),
                  Text(
                    AppInfo.appName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Lista narzędzi
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: tools.length,
              itemBuilder: (context, index) {
                final tool = tools[index];
                final isSelected = location == tool.route.location;

                return ListTile(
                  leading: Icon(
                    tool.icon,
                    color: isSelected ? Colors.blueAccent : Colors.white70,
                  ),
                  title: Text(
                    tool.labelKey.tr(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  selected: isSelected,
                  selectedTileColor: Colors.blueAccent.withValues(alpha: 0.1),
                  onTap: () {
                    context.pop();
                    tool.route.go(context);
                  },
                );
              },
            ),
          ),

          // Stopka z ustawieniami
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white70),
            title: Text(LocaleKeys.settings.tr()),
            onTap: () {
              context.pop();
              const SettingsRoute().push(context);
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

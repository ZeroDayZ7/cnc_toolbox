import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.precision_manufacturing,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                  AppSpacings.gapMs,
                  Text(
                    AppInfo.appName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
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
              itemCount: appNavigation.length,
              itemBuilder: (context, index) {
                final tool = appNavigation[index];
                final isSelected = tool.isActive(location);

                return ListTile(
                  leading: Icon(
                    tool.icon,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  title: Text(
                    tool.labelKey.tr(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  selected: isSelected,
                  selectedTileColor: Colors.blueAccent.withValues(alpha: 0.1),
                  onTap: () {
                    if (isSelected) {
                      context.pop();
                    } else {
                      tool.navigateTo(context);
                    }
                  },
                );
              },
            ),
          ),

          // Stopka z ustawieniami
          const Divider(height: 1),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            title: Text(
              LocaleKeys.settings.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            onTap: () {
              final String settingsLocation = const SettingsRoute().location;
              if (location == settingsLocation) {
                context.pop();
              } else {
                context.pop();
                const SettingsRoute().push(context);
              }
            },
          ),
          AppSpacings.gapMs,
        ],
      ),
    );
  }
}

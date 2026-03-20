import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:flutter/material.dart';

import 'responsive_container.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? sidebar;
  final Widget? title;
  final List<Widget>? actions;
  final ContainerSize size;
  final bool scrollable;
  final bool useSafeArea;

  const AppScaffold({
    super.key,
    required this.child,
    this.sidebar,
    this.title,
    this.actions,
    this.size = ContainerSize.medium,
    this.scrollable = true,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;

        Widget content = ResponsiveContainer(
          size: size,
          child: scrollable ? SingleChildScrollView(child: child) : child,
        );

        if (useSafeArea) content = SafeArea(child: content);

        if (isDesktop) {
          // Widok Desktop: Sidebar na stałe po lewej
          return Scaffold(
            body: Row(
              children: [
                if (sidebar != null) SizedBox(width: 280, child: sidebar),
                if (sidebar != null) const VerticalDivider(width: 1),
                Expanded(
                  child: Scaffold(
                    appBar: title != null
                        ? AppBar(
                            title: title,
                            actions: actions,
                            centerTitle: false,
                          )
                        : null,
                    body: content,
                  ),
                ),
              ],
            ),
          );
        }

        // Widok Mobile: Sidebar w Drawerze
        return Scaffold(
          appBar: title != null
              ? AppBar(title: title, actions: actions, centerTitle: true)
              : null,
          drawer: sidebar != null ? Drawer(child: sidebar) : null,
          body: content,
        );
      },
    );
  }
}

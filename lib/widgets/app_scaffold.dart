import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/core/utils/responsive_utils.dart';
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
    final isDesktop = context.isDesktop;

    Widget content = ResponsiveContainer(
      size: size,
      child: scrollable ? SingleChildScrollView(child: child) : child,
    );

    if (useSafeArea) content = SafeArea(child: content);

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            if (sidebar != null)
              SizedBox(width: AppBreakpoints.sidebarWidth, child: sidebar),
            if (sidebar != null) const VerticalDivider(width: 1),
            Expanded(
              child: Scaffold(
                appBar: title != null
                    ? AppBar(title: title, actions: actions, centerTitle: false)
                    : null,
                body: content,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: title != null
          ? AppBar(title: title, actions: actions, centerTitle: true)
          : null,
      drawer: sidebar != null ? Drawer(child: sidebar) : null,
      body: content,
    );
  }
}

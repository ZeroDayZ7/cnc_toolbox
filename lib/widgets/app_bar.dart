import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CncAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleKey;
  final bool showBackButton;
  final List<Widget>? actions;
  final VoidCallback? onBackPress;

  const CncAppBar({
    super.key,
    required this.titleKey,
    this.showBackButton = true,
    this.actions,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleKey).tr(),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed:
                  onBackPress ??
                  () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go(Routes.home);
                    }
                  },
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

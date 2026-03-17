import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/feed_rate_actions.dart';
import 'widgets/feed_rate_form.dart';

class FeedRatePage extends StatelessWidget {
  const FeedRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.tools_feed_rate.tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(Routes.home),
          ),
          actions: [const FeedRateActions()],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Podstawowy", icon: Icon(Icons.calculate)),
              Tab(text: "Łuk / Otwór", icon: Icon(Icons.refresh)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FeedRateForm(type: "basic"),
            FeedRateForm(type: "arc"),
          ],
        ),
      ),
    );
  }
}

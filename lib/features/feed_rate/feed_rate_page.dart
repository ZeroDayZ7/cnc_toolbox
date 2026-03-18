import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/feed_rate_actions.dart';
import 'widgets/feed_rate_form.dart';

class FeedRatePage extends StatelessWidget {
  const FeedRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CncAppBar(
          titleKey: LocaleKeys.tools_feed_rate,
          actions: [FeedRateActions()],
          bottom: TabBar(
            tabs: [
              Tab(text: "Podstawowy", icon: Icon(Icons.calculate)),
              Tab(text: "Łuk / Otwór", icon: Icon(Icons.refresh)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FeedRateForm(type: "basic"),
            FeedRateForm(type: "arc"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trip_advisor/modules/account/presentation/view/account_view.dart';
import 'package:trip_advisor/modules/explore/presentation/view/explore_view.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/view/view.dart';
import 'package:trip_advisor/modules/review/presentation/view/review_view.dart';
import 'package:trip_advisor/modules/search/presentation/search_view.dart';

enum Tabs { explore, search, plan, review, account }

extension TabsX on Tabs {
  IconTab get iconTab {
    switch (this) {
      case Tabs.explore:
        return IconTab(
          label: 'Explore',
          icon: Icons.home_rounded,
          route: ExploreView.route(),
        );
      case Tabs.search:
        return IconTab(
          label: 'Search',
          icon: Icons.search,
          route: SearchView.route(),
        );
      case Tabs.plan:
        return IconTab(
          label: 'Plan',
          icon: Icons.favorite,
          route: PlanTripPage.route(),
        );
      case Tabs.review:
        return IconTab(
          label: 'Review',
          icon: Icons.create,
          route: ReviewView.route(),
        );
      case Tabs.account:
        return IconTab(
          label: 'Account',
          icon: Icons.home_rounded,
          route: AccountView.route(),
        );
      default:
        return IconTab(
          label: 'Explore',
          icon: Icons.home_rounded,
          route: ExploreView.route(),
        );
    }
  }
}

class IconTab {
  const IconTab({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;
}

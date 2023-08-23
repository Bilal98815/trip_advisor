part of 'models.dart';

enum Tabs { explore, search, plan, review, account }

extension TabsX on Tabs {
  IconTab get iconTab {
    switch (this) {
      case Tabs.explore:
        return IconTab(
          label: LocaleStrings.exploreTab,
          icon: Icons.home_rounded,
          route: ExplorePage.route(),
        );
      case Tabs.search:
        return IconTab(
          label: LocaleStrings.searchTab,
          icon: Icons.search,
          route: SearchView.route(),
        );
      case Tabs.plan:
        return IconTab(
          label: LocaleStrings.planTab,
          icon: Icons.favorite,
          route: PlanTripPage.route(),
        );
      case Tabs.review:
        return IconTab(
          label: LocaleStrings.reviewTab,
          icon: Icons.create,
          route: ReviewPage.route(),
        );
      case Tabs.account:
        return IconTab(
          label: LocaleStrings.accountTab,
          icon: Icons.person,
          route: AccountView.route(),
        );
      default:
        return IconTab(
          label: LocaleStrings.exploreTab,
          icon: Icons.home_rounded,
          route: ExplorePage.route(),
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

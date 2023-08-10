import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/modules/account/presentation/view/account_view.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/models/icon_tab.dart';
import 'package:trip_advisor/modules/explore/presentation/view/explore_view.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/view/plan_trip_view.dart';
import 'package:trip_advisor/modules/review/presentation/view/review_view.dart';
import 'package:trip_advisor/modules/search/presentation/search_view.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  final Widget child;
  final String currentRoute;

  final List<IconTab> tabs = [
    IconTab(
      index: 0,
      label: 'Explore',
      icon: Icons.home_rounded,
      route: ExploreView.route(),
    ),
    IconTab(
      index: 1,
      label: 'Search',
      icon: Icons.search,
      route: SearchView.route(),
    ),
    IconTab(
      index: 2,
      label: 'Plan',
      icon: Icons.favorite,
      route: PlanTripView.route(),
    ),
    IconTab(
      index: 3,
      label: 'Review',
      icon: Icons.create,
      route: ReviewView.route(),
    ),
    IconTab(
      index: 4,
      label: 'Account',
      icon: Icons.home_rounded,
      route: AccountView.route(),
    ),
  ];

  int getCurrentIndex() {
    for (int i = 0; i < tabs.length; i++) {
      if (tabs[i].route == currentRoute) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = getCurrentIndex();

    return Scaffold(
      bottomNavigationBar: LayoutBuilder(builder: (context, size) {
        return BottomNavigationBar(
          backgroundColor: Colors.black87,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (val) => context.go(tabs[val].route),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          items: List.generate(
            tabs.length,
            (index) => BottomNavigationBarItem(
              icon: NavBarIcon(
                iconTab: tabs[index],
                isActive: currentIndex == index,
                size: size,
              ),
              label: tabs[index].label,
            ),
          ),
        );
      }),
      body: SafeArea(child: child),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    super.key,
    required this.iconTab,
    required this.isActive,
    required this.size,
  });

  final IconTab iconTab;
  final bool isActive;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Column(
            children: [
              Container(
                width: size.maxWidth * 0.13,
                height: size.maxHeight * 0.003,
                color: Colors.lightGreenAccent,
              ),
              SizedBox(
                height: size.maxHeight * 0.005,
              ),
              Icon(iconTab.icon),
            ],
          )
        : Icon(iconTab.icon);
  }
}

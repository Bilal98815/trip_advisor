import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/modules/account/presentation/view/account_view.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/bloc/bottom_bar_bloc.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/bloc/bottom_bar_event.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/models/icon_tab.dart';
import 'package:trip_advisor/modules/explore/presentation/view/explore_view.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/view/plan_trip_view.dart';
import 'package:trip_advisor/modules/review/presentation/view/review_view.dart';
import 'package:trip_advisor/modules/search/presentation/search_view.dart';

import '../bloc/bottom_bar_state.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key, required this.child});

  final Widget child;

  final List<IconTab> tabs = [
    IconTab(
      index: 0,
      label: 'Explore',
      icon: Icons.home_rounded,
      location: ExploreView.route(),
    ),
    IconTab(
      index: 1,
      label: 'Search',
      icon: Icons.search,
      location: SearchView.route(),
    ),
    IconTab(
      index: 2,
      label: 'Plan',
      icon: Icons.favorite,
      location: PlanTripView.route(),
    ),
    IconTab(
      index: 3,
      label: 'Review',
      icon: Icons.create,
      location: ReviewView.route(),
    ),
    IconTab(
      index: 4,
      label: 'Account',
      icon: Icons.home_rounded,
      location: AccountView.route(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          return LayoutBuilder(builder: (context, size) {
            return BottomNavigationBar(
              backgroundColor: Colors.black87,
              type: BottomNavigationBarType.fixed,
              currentIndex: state.index,
              onTap: (val) {
                context.read<BottomBarBloc>().add(BottomBarEvent(index: val));
                context.go(tabs[val].location);
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.withOpacity(0.7),
              items: List.generate(
                tabs.length,
                (index) => BottomNavigationBarItem(
                  icon: NavBarIcon(
                    iconTab: tabs[index],
                    currentIndex: state.index,
                    size: size,
                  ),
                  label: tabs[index].label,
                ),
              ),
            );
          });
        },
      ),
      body: SafeArea(child: child),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    super.key,
    required this.iconTab,
    required this.currentIndex,
    required this.size,
  });

  final IconTab iconTab;
  final int currentIndex;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return currentIndex == iconTab.index
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

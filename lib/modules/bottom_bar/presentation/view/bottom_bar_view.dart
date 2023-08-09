import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/modules/account/presentation/view/account_view.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/bloc/bottom_bar_bloc.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/bloc/bottom_bar_event.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/view/plan_trip_view.dart';
import 'package:trip_advisor/modules/review/presentation/view/review_view.dart';

import '../bloc/bottom_bar_state.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key, required this.child});

  final Widget child;

  final List<String> locations = [
    '/explore',
    '/search',
    PlanTripView.route(),
    ReviewView.route(),
    AccountView.route(),
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
                context.go(locations[val]);
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.withOpacity(0.7),
              items: [
                BottomNavigationBarItem(
                    icon: state.index == 0
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
                              const Icon(Icons.home_rounded),
                            ],
                          )
                        : const Icon(Icons.home_rounded),
                    label: 'Explore'),
                BottomNavigationBarItem(
                    icon: state.index == 1
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
                              const Icon(Icons.search),
                            ],
                          )
                        : const Icon(Icons.search),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: state.index == 2
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
                              const Icon(Icons.favorite),
                            ],
                          )
                        : const Icon(Icons.favorite),
                    label: 'Plan'),
                BottomNavigationBarItem(
                    icon: state.index == 3
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
                              const Icon(Icons.create),
                            ],
                          )
                        : const Icon(Icons.create),
                    label: 'Review'),
                BottomNavigationBarItem(
                    icon: state.index == 4
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
                              const Icon(Icons.person),
                            ],
                          )
                        : const Icon(Icons.person),
                    label: 'Account'),
              ],
            );
          });
        },
      ),
      body: SafeArea(child: child),
    );
  }
}

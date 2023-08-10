import 'package:flutter/material.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/widgets/trips_view.dart';

class PlanTripView extends StatelessWidget {
  const PlanTripView({super.key});

  static const routeName = '/plan';
  static String route() => '/plan';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, size) {
              return Container(
                width: size.maxWidth,
                height: size.maxHeight,
                color: Colors.black87,
                //padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.maxHeight * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.07,
                      ),
                      child: const CommonText(
                        text: 'Plan',
                        color: Colors.white,
                        fontsize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.03,
                      ),
                      child: const TabBar(
                        indicatorColor: Colors.white,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: CommonText(
                              text: 'Trips',
                              color: Colors.white,
                              fontsize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Tab(
                            child: CommonText(
                              text: 'Saves',
                              color: Colors.white,
                              fontsize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TripsView(size: size),
                          Column(
                            children: [
                              SizedBox(
                                height: size.maxHeight * 0.03,
                              ),
                              const CommonText(
                                text: 'No Saves yet',
                                color: Colors.white,
                                fontsize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              const CommonText(
                                text: 'Places you save will appear here.',
                                color: Colors.white,
                                fontsize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

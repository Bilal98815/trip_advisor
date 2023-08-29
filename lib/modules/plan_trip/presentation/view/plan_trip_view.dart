part of 'view.dart';

class PlanTripView extends StatelessWidget {
  const PlanTripView({super.key});

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
                color: Theme.of(context).colorScheme.background,
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
                      child: Text(
                        LocaleStrings.planTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.03,
                      ),
                      child: TabBar(
                        indicatorColor:
                            Theme.of(context).tabBarTheme.indicatorColor,
                        dividerColor:
                            Theme.of(context).tabBarTheme.dividerColor,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Text(
                              LocaleStrings.tripsTabTitle,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Tab(
                            child: Text(
                              LocaleStrings.savesTabTitle,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TripsView(
                            size: size,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: size.maxHeight * 0.03,
                              ),
                              Text(
                                LocaleStrings.savesTabHeading,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                LocaleStrings.savesTabPlace,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w300),
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

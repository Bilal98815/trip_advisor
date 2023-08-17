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
                      child: CommonText(
                        text: LocaleStrings.planTitle,
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
                      child: TabBar(
                        indicatorColor: Colors.white,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: CommonText(
                              text: LocaleStrings.tripsTabTitle,
                              color: Colors.white,
                              fontsize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Tab(
                            child: CommonText(
                              text: LocaleStrings.savesTabTitle,
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
                              CommonText(
                                text: LocaleStrings.savesTabHeading,
                                color: Colors.white,
                                fontsize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              CommonText(
                                text: LocaleStrings.savesTabPlace,
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

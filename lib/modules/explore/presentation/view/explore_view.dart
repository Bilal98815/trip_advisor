part of 'view.dart';

class ExploreView extends StatelessWidget {
  ExploreView({super.key});

  final List<TripModel> tripModel = [
    TripModel(
      name: 'Nugget Falls',
      rating: 2.5,
      description: 'WaterFalls',
      location: 'Juneau, Alaska',
      isTravellersChoice: 0,
      image: 'assets/trip1.jpg',
    ),
    TripModel(
      name: 'Cambridge Beaches Resort & Spa',
      rating: 4,
      description: 'All-inclusive',
      location: 'Sandys Parish, Bermuda',
      isTravellersChoice: 0,
      image: 'assets/trip2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<ExploreBloc, ExploreState>(
        builder: (context, state) {
          if (state.apiState == ApiState.done) {
            return LayoutBuilder(
              builder: (context, size) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.maxWidth,
                        height: size.maxHeight * 0.39,
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.maxWidth * 0.08,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.maxHeight * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: size.maxWidth * 0.1,
                                    height: size.maxHeight * 0.06,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage('assets/mine.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.maxWidth * 0.05,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 23,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.maxHeight * 0.02,
                              ),
                              Text(
                                LocaleStrings.exploreTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                              ),
                              SizedBox(
                                height: size.maxHeight * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryButton(
                                    title: LocaleStrings.exploreHotelButton,
                                    img: 'assets/bed.png',
                                    onTap: () {},
                                    size: size,
                                  ),
                                  CategoryButton(
                                    title:
                                        LocaleStrings.exploreThingsTodoButton,
                                    img: 'assets/invoice.png',
                                    onTap: () {},
                                    size: size,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.maxHeight * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryButton(
                                    title:
                                        LocaleStrings.exploreRestaurantButton,
                                    img: 'assets/cutlery.png',
                                    onTap: () {},
                                    size: size,
                                  ),
                                  CategoryButton(
                                    title: LocaleStrings.exploreForumsButton,
                                    img: 'assets/forums.png',
                                    onTap: () {},
                                    size: size,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: Container(
                          width: size.maxWidth,
                          height: size.maxHeight * 0.28,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.maxHeight * 0.04,
                                ),
                                Text(
                                  LocaleStrings.exploreDiscoverTitle,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(fontSize: 35),
                                ),
                                SizedBox(
                                  height: size.maxHeight * 0.03,
                                ),
                                ExploreButton(size: size, onTap: () {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: Text(
                          LocaleStrings.exploreLikeThisTile,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.013,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: Text(
                          LocaleStrings.exploreMoreThingsTile,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: BlocBuilder<ExploreBloc, ExploreState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: size.maxHeight * 0.6,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.trips.length,
                                itemBuilder: (context, index) {
                                  // debugPrint('${state.trips.length}');
                                  return TripCard(
                                    tripModel: state.trips[index],
                                    size: size,
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: size.maxWidth * 0.04,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      ImageContainer(
                        size: size,
                        onTap: () {},
                        heading:
                            LocaleStrings.explorePerfectWeekendContainerHeading,
                        subHeading: LocaleStrings
                            .explorePerfectWeekendContainerSubHeading,
                        buttonTitle:
                            LocaleStrings.explorePerfectWeekendContainerButton,
                        image: 'assets/stone_monument.jpg',
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: Text(
                          LocaleStrings.exploreOceanTripsTitle,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.013,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: Text(
                          LocaleStrings.exploreOceanTripsSubTitle,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: BlocBuilder<ExploreBloc, ExploreState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: size.maxHeight * 0.6,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.oceanTrips.length,
                                itemBuilder: (context, index) {
                                  return TripCard(
                                    tripModel: state.oceanTrips[index],
                                    size: size,
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: size.maxWidth * 0.04,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      ImageContainer(
                        size: size,
                        onTap: () {},
                        heading: LocaleStrings.exploreLondonContainerHeading,
                        subHeading:
                            LocaleStrings.exploreLondonContainerSubHeading,
                        buttonTitle: LocaleStrings.exploreLondonContainerButton,
                        image: 'assets/london.jpg',
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.02,
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}

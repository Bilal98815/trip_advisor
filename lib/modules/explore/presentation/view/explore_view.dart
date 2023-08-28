part of 'view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ExploreBloc, ExploreState>(
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
                        if (state.recentTrips.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.maxWidth * 0.08,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recently viewed',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                SizedBox(
                                  height: size.maxHeight * 0.02,
                                ),
                                BlocBuilder<ExploreBloc, ExploreState>(
                                  builder: (context, state) {
                                    return SizedBox(
                                      height: size.maxHeight * 0.6,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: state.recentTrips.length,
                                        itemBuilder: (context, index) {
                                          return TripCard(
                                            tripModel: state.recentTrips[index],
                                            size: size,
                                            favouriteTap: () {},
                                            onTap: () {
                                              context.goNamed(
                                                TripDetailView.routeName,
                                                extra: {
                                                  'tripModel':
                                                      state.recentTrips[index],
                                                },
                                              );
                                            },
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
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.maxWidth * 0.08,
                          ),
                          child: GuidedActionWidget(
                            size: size,
                            title: LocaleStrings.exploreDiscoverTitle,
                            button: ExploreButton(size: size, onTap: () {}),
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
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
                                    return TripCard(
                                      tripModel: state.trips[index],
                                      size: size,
                                      favouriteTap: () {},
                                      onTap: () {
                                        context.read<ExploreBloc>().add(
                                              AddToRecentTipsEvent(
                                                trip: state.trips[index],
                                              ),
                                            );
                                        context.goNamed(
                                          TripDetailView.routeName,
                                          extra: {
                                            'tripModel': state.trips[index],
                                          },
                                        );
                                      },
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
                          heading: LocaleStrings
                              .explorePerfectWeekendContainerHeading,
                          subHeading: LocaleStrings
                              .explorePerfectWeekendContainerSubHeading,
                          buttonTitle: LocaleStrings
                              .explorePerfectWeekendContainerButton,
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
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
                                      favouriteTap: () {},
                                      onTap: () {
                                        context.read<ExploreBloc>().add(
                                              AddToRecentTipsEvent(
                                                trip: state.oceanTrips[index],
                                              ),
                                            );
                                        context.goNamed(
                                          TripDetailView.routeName,
                                          extra: {
                                            'tripModel':
                                                state.oceanTrips[index],
                                          },
                                        );
                                      },
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.maxWidth * 0.08,
                          ),
                          child: Text(
                            'Kid-friendly Caribbean islands',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
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
                            'Plan a (meltdown-free) beach vacay',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
                                height: size.maxHeight * 0.35,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.oceanTrips.length,
                                  itemBuilder: (context, index) {
                                    return TripSnapWidget(
                                      size: size,
                                      tripModel: state.islandTrips[index],
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
                        SizedBox(
                          height: size.maxHeight * 0.06,
                        ),
                        ImageContainer(
                          size: size,
                          onTap: () {},
                          heading: LocaleStrings.exploreLondonContainerHeading,
                          subHeading:
                              LocaleStrings.exploreLondonContainerSubHeading,
                          buttonTitle:
                              LocaleStrings.exploreLondonContainerButton,
                          image: 'assets/london.jpg',
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.06,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.maxWidth * 0.08,
                          ),
                          child: Text(
                            'Outdoor--and out of this world',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
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
                            'Destinations that feel like another planet',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
                                height: size.maxHeight * 0.35,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.oceanTrips.length,
                                  itemBuilder: (context, index) {
                                    return TripSnapWidget(
                                      size: size,
                                      tripModel: state.mountainTrips[index],
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
                        SizedBox(
                          height: size.maxHeight * 0.06,
                        ),
                        ImageContainer(
                          size: size,
                          onTap: () {},
                          heading: "Cruisin' through the East Coast",
                          subHeading:
                              'Buckle uo and enjoy the ride on these road trip routes',
                          buttonTitle: "Let's roll",
                          image: 'assets/forest_road.jpg',
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.06,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.maxWidth * 0.08,
                          ),
                          child: Text(
                            'Bring on the oohs and aahs',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
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
                            "Can't miss natural wonders in the U.S.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
                                  itemCount: state.naturalWondersTrips.length,
                                  itemBuilder: (context, index) {
                                    return TripCard(
                                      tripModel:
                                          state.naturalWondersTrips[index],
                                      size: size,
                                      favouriteTap: () {},
                                      onTap: () {
                                        context.read<ExploreBloc>().add(
                                              AddToRecentTipsEvent(
                                                trip: state
                                                    .naturalWondersTrips[index],
                                              ),
                                            );
                                        context.goNamed(
                                          TripDetailView.routeName,
                                          extra: {
                                            'tripModel': state
                                                .naturalWondersTrips[index],
                                          },
                                        );
                                      },
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.maxWidth * 0.08,
                          ),
                          child: GuidedActionWidget(
                            size: size,
                            title: 'Is Tripadvisor missing a place?',
                            button: MissingPlaceButton(
                              onTap: () {},
                              size: size,
                              width: size.maxWidth * 0.65,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.04,
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
        ),
      ),
    );
  }
}

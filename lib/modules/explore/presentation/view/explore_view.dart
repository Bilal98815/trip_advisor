part of 'view.dart';

class ExploreView extends StatelessWidget {
  ExploreView({super.key});

  static const routeName = '/explore';

  static String route() => '/explore';

  final TripModel tripModel = TripModel(
    name: 'Nugget Falls',
    rating: 2.5,
    description: 'WaterFalls',
    location: 'Juneau, Alaska',
    isTravellersChoice: false,
    image: 'assets/trip1.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
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
                            // todo add text in languages
                            LocaleStrings.exploreTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryButton(
                                title: LocaleStrings.exploreHotelButton,
                                img: 'assets/bed.png',
                                onTap: () {},
                                size: size,
                              ),
                              CategoryButton(
                                title: LocaleStrings.exploreThingsTodoButton,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryButton(
                                title: LocaleStrings.exploreRestaurantButton,
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
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
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
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.maxWidth * 0.08,
                    ),
                    child: Text(
                      LocaleStrings.exploreLikeThisTile,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TripCard(
                            tripModel: tripModel,
                            size: size,
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.04,
                          ),
                          TripCard(
                            tripModel: tripModel,
                            size: size,
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.04,
                          ),
                          TripCard(
                            tripModel: tripModel,
                            size: size,
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.04,
                          ),
                          TripCard(
                            tripModel: tripModel,
                            size: size,
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.04,
                          ),
                          TripCard(
                            tripModel: tripModel,
                            size: size,
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.04,
                          ),
                          TripCard(
                            tripModel: tripModel,
                            size: size,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ImageContainer(
                    size: size,
                    onTap: () {},
                    heading:
                        LocaleStrings.explorePerfectWeekendContainerHeading,
                    subHeading:
                        LocaleStrings.explorePerfectWeekendContainerSubHeading,
                    buttonTitle:
                        LocaleStrings.explorePerfectWeekendContainerButton,
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

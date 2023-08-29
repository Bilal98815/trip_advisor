part of 'view.dart';

class TripDetailView extends StatelessWidget {
  const TripDetailView({required this.tripModel, super.key});

  static const routeName = 'tripDetail';

  static String route() => '/explore/tripDetail';

  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.share,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: Icon(
                tripModel.isFavourite ?? false
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: tripModel.image ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      height: size.maxHeight * 0.4,
                      width: size.maxWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (tripModel.isAward == 1)
                          AwardContainer(
                            awardTitle: LocaleStrings.exploreTopRatedTitle,
                            size: size,
                          )
                        else if (tripModel.isAward == 2)
                          AwardContainer(
                            awardTitle: LocaleStrings.exploreTopSellerTitle,
                            size: size,
                          ),
                        SizedBox(
                          height: size.maxHeight * 0.02,
                        ),
                        Text(
                          tripModel.name ?? '',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(fontSize: 32),
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.02,
                        ),
                        Row(
                          children: [
                            RatingWidget(
                              rating: tripModel.rating ?? 0,
                              ratingImageSize: size.maxWidth * 0.045,
                              iconSize: 24,
                              size: size,
                            ),
                            SizedBox(
                              width: size.maxWidth * 0.03,
                            ),
                            Text(
                              '${tripModel.rating} ${LocaleStrings.tripDetailRating}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        Text(
                          LocaleStrings.tripDetailAbout,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (tripModel.description != '')
                          Text(
                            '${tripModel.description}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        Text(
                          '${tripModel.location}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.04,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: SpecialRateTile(
                      onTap: () => UrlLauncher().launchCustomUrl(
                        Uri.parse('https://www.google.com'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  const Divider(),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  if (tripModel.isTravellersChoice == 1)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleStrings.tripDetailAwards,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                          ),
                          TravellersChoiceTile(
                            size: size,
                            color: kForestGreen,
                            title: LocaleStrings.tripDetailTravellersChoice,
                          ),
                        ],
                      ),
                    )
                  else if (tripModel.isTravellersChoice == 2)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleStrings.tripDetailAwards,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                          ),
                          TravellersChoiceTile(
                            size: size,
                            color: kYellow,
                            title: LocaleStrings.tripDetailTravellersChoiceBest,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.maxWidth * 0.08,
                    ),
                    child: AmenitiesWidget(
                      width: size.maxWidth * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.06,
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

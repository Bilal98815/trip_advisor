part of 'widgets.dart';

class TripCard extends StatelessWidget {
  const TripCard({required this.tripModel, required this.size, super.key});

  final TripModel tripModel;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.maxWidth * 0.6,
      height: size.maxHeight * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.maxHeight * 0.35,
            child: Stack(
              children: [
                Container(
                  width: size.maxWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(tripModel.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.maxWidth * 0.1,
                      height: size.maxHeight * 0.06,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: kBlack,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                if (tripModel.isTravellersChoice!)
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: TravellersChoiceWidget(size: size),
                    ),
                  )
                else
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox.shrink(),
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: size.maxHeight * 0.02,
          ),
          Text(
            tripModel.name ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          SizedBox(
            height: size.maxHeight * 0.005,
          ),
          Row(
            children: [
              RatingWidget(
                rating: tripModel.rating ?? 0,
                size: size,
              ),
              SizedBox(
                width: size.maxWidth * 0.03,
              ),
              Text('${tripModel.rating}'),
            ],
          ),
          SizedBox(
            height: size.maxHeight * 0.005,
          ),
          Text(
            tripModel.description ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          SizedBox(
            height: size.maxHeight * 0.005,
          ),
          Text(
            tripModel.location ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ],
      ),
    );
  }
}

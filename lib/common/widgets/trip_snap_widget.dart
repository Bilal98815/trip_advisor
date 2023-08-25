part of 'widgets.dart';

class TripSnapWidget extends StatelessWidget {
  const TripSnapWidget(
      {required this.size, required this.tripModel, super.key});

  final BoxConstraints size;
  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: tripModel.image ?? '',
        imageBuilder: (context, imageProvider) => Container(
          height: size.maxHeight * 0.35,
          width: size.maxWidth * 0.6,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: size.maxWidth * 0.04,
            vertical: size.maxHeight * 0.02,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              tripModel.name ?? '',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

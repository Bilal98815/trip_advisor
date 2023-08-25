part of 'view.dart';

class TripDetailView extends StatelessWidget {
  const TripDetailView({required this.tripModel, super.key});

  static const routeName = 'tripDetail';
  static String route() => '/explore/tripDetail';

  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return CachedNetworkImage(
              imageUrl: tripModel.image ?? '',
              imageBuilder: (context, imageProvider) => Container(
                height: size.maxHeight * 0.4,
                width: size.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
        ),
      ),
    );
  }
}

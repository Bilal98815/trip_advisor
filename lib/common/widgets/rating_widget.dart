part of 'widgets.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget(
      {required this.rating,
      required this.size,
      required this.iconSize,
      required this.ratingImageSize,
      super.key});

  final double rating;
  final BoxConstraints size;
  final double iconSize;
  final double ratingImageSize;

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool hasFullStar = rating - fullStars >= 0.5;
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index < fullStars) {
            return Icon(
              Icons.circle,
              color: const Color(0xFF3DB489),
              size: iconSize,
            );
          } else if (index == fullStars && hasFullStar) {
            return Image.asset(
              'assets/half_circle.png',
              width: ratingImageSize,
            );
          } else {
            return Icon(
              Icons.circle_outlined,
              color: const Color(0xFF3DB489),
              size: iconSize,
            );
          }
        },
      ),
    );
  }
}

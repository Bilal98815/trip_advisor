part of 'widgets.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({required this.rating, required this.size, super.key});

  final double rating;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool hasFullStar = rating - fullStars >= 0.5;
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index < fullStars) {
            return const Icon(
              Icons.circle,
              color: Color(0xFF3DB489),
            );
          } else if (index == fullStars && hasFullStar) {
            return Image.asset(
              'assets/half_circle.png',
              width: size.maxWidth * 0.036,
            );
          } else {
            return const Icon(
              Icons.circle_outlined,
              color: Color(0xFF3DB489),
            );
          }
        },
      ),
    );
  }
}

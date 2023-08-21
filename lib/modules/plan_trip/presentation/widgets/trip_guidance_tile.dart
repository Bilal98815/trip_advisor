part of 'widgets.dart';

class TripGuidanceTile extends StatelessWidget {
  const TripGuidanceTile({
    required this.size,
    required this.image,
    required this.text,
    super.key,
  });

  final BoxConstraints size;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.maxWidth * 0.2,
          height: size.maxHeight * 0.05,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              image,
              width: size.maxWidth * 0.045,
            ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

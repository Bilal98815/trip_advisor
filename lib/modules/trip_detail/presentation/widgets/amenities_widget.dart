part of 'widgets.dart';

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.info_outline,
          size: 28,
        ),
        SizedBox(
          width: width,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amenities',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
            ),
            Text(
              'Free parking',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Free High Speed Internet(Wifi)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Pool',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Fitness Center with Gym / Workout Room',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )
      ],
    );
  }
}

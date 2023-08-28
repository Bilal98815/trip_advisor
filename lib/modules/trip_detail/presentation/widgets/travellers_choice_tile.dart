part of 'widgets.dart';

class TravellersChoiceTile extends StatelessWidget {
  const TravellersChoiceTile({
    required this.size,
    required this.color,
    required this.title,
    super.key,
  });

  final BoxConstraints size;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.maxWidth * 0.11,
          height: size.maxHeight * 0.1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Image.asset(
              'assets/owl.png',
              width: size.maxWidth * 0.054,
            ),
          ),
        ),
        SizedBox(
          width: size.maxWidth * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
            ),
            Text(
              '2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

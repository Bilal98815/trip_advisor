part of 'widgets.dart';

class SupportTile extends StatelessWidget {
  const SupportTile({
    required this.size,
    required this.title,
    required this.onTap,
    super.key,
  });
  final BoxConstraints size;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: Image.asset(
                'assets/diagonal_arrow.png',
                width: size.maxWidth * 0.03,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.017,
        ),
        const Divider(),
      ],
    );
  }
}

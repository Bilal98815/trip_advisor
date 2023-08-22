part of 'widgets.dart';

class MoreOptionTile extends StatelessWidget {
  const MoreOptionTile({
    required this.onTap,
    required this.size,
    required this.title,
    super.key,
  });
  final String title;
  final VoidCallback onTap;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 15,
                  ),
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.01,
        ),
        const Divider(),
      ],
    );
  }
}

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
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.displayMedium),
                const Spacer(),
                const Icon(Icons.arrow_outward),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

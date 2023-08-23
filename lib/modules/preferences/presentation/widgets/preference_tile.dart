part of 'widgets.dart';

class PreferenceTile extends StatelessWidget {
  const PreferenceTile({
    required this.onTap,
    required this.title,
    this.details = '',
    super.key,
  });

  final String title;
  final String details;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.labelSmall),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 15),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

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
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Text(title, style: textTheme.labelSmall),
                const Spacer(),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                    minHeight: 40,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      details,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      textAlign: TextAlign.end,
                      softWrap: true,
                    ),
                  ),
                ),
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

part of 'widgets.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({
    required this.image,
    required this.onTap,
    required this.title,
    super.key,
  });
  final String image;
  final String title;

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
                Image.asset(image, width: 18),
                const SizedBox(width: 20),
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

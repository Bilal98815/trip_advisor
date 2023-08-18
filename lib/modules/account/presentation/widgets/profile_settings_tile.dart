part of 'widgets.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({
    this.image,
    required this.onTap,
    required this.title,
    this.size,
    super.key,
  });
  final String? image;
  final String title;
  final BoxConstraints? size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                if (image != null) ...[
                  Image.asset(image!, width: 18),
                  const SizedBox(width: 20),
                ],
                TileTitleText(title: title),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.3,
          color: Colors.grey,
        ),
      ],
    );
  }
}

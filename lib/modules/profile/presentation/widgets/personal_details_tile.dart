part of 'widgets.dart';

class PersonalDetailTile extends StatelessWidget {
  const PersonalDetailTile({
    required this.size,
    required this.text,
    required this.onTap,
    required this.image,
    super.key,
  });
  final BoxConstraints size;
  final String text;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image, width: size.maxWidth * 0.045),
          SizedBox(width: size.maxWidth * 0.04),
          Text(
            text,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

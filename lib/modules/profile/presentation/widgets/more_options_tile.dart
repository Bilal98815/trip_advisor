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
            CommonText(
              text: title,
              color: Colors.white,
              fontsize: 15,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.01,
        ),
        const Divider(
          thickness: 0.4,
          color: Colors.grey,
        ),
      ],
    );
  }
}

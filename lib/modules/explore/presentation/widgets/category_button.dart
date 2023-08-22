part of 'widgets.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {required this.title,
      required this.img,
      required this.onTap,
      required this.size,
      super.key});

  final String title;
  final String img;
  final BoxConstraints size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.maxWidth * 0.41,
        height: size.maxHeight * 0.072,
        padding: EdgeInsets.only(left: size.maxWidth * 0.05),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
        ),
        child: Row(
          children: [
            Image.asset(
              img,
              width: size.maxWidth * 0.045,
            ),
            SizedBox(
              width: size.maxWidth * 0.03,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

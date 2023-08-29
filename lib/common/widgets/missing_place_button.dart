part of 'widgets.dart';

class MissingPlaceButton extends StatelessWidget {
  const MissingPlaceButton({
    required this.onTap,
    required this.size,
    required this.width,
    required this.color,
    super.key,
  });

  final VoidCallback onTap;
  final BoxConstraints size;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: size.maxHeight * 0.06,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetProvider.of(context).assets.missingPlaceIcon,
              width: size.maxWidth * 0.045,
            ),
            SizedBox(width: size.maxWidth * 0.03),
            Text(
              LocaleStrings.reviewMissingPlaceButton,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}

part of 'widgets.dart';

class MissingPlaceButton extends StatelessWidget {
  const MissingPlaceButton({
    required this.onTap,
    required this.size,
    super.key,
  });

  final VoidCallback onTap;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.maxWidth,
        height: size.maxHeight * 0.06,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.of(context).missingPlaceIcon,
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

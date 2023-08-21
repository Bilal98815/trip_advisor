part of 'widgets.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    required this.title,
    required this.onTap,
    required this.image,
    required this.size,
    super.key,
  });
  final String image;
  final String title;
  final BoxConstraints size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: size.maxHeight * 0.02,
          horizontal: size.maxWidth * 0.05,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Image.asset(image, width: 22, height: 22),
            SizedBox(width: size.maxWidth * 0.13),
            Text(title, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

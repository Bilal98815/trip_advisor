part of 'widgets.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({required this.size, required this.onTap, super.key});

  final BoxConstraints size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.maxWidth * 0.4,
        height: size.maxHeight * 0.065,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            LocaleStrings.exploreKeepExploringButton,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                ),
          ),
        ),
      ),
    );
  }
}

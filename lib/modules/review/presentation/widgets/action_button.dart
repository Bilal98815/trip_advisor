part of 'widgets.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.size,
    required this.text,
    required this.onTap,
    super.key,
  });
  final BoxConstraints size;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.maxWidth * 0.4,
        height: size.maxHeight * 0.06,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}

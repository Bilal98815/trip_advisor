part of 'widgets.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onTap,
    required this.color,
    required this.height,
    required this.ignoring,
    required this.child,
    required this.size,
    super.key,
  });
  final BoxConstraints size;
  final Color color;
  final VoidCallback onTap;
  final double height;
  final bool ignoring;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoring,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            border: Border.all(
              color: Theme.of(context).colorScheme.onBackground,
              width: 2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

part of 'widgets.dart';

class GuidedActionWidget extends StatelessWidget {
  const GuidedActionWidget({
    required this.size,
    required this.title,
    required this.button,
    super.key,
  });

  final BoxConstraints size;
  final String title;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.maxWidth,
      height: size.maxHeight * 0.28,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.maxHeight * 0.04,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 35),
            ),
            SizedBox(
              height: size.maxHeight * 0.03,
            ),
            button,
          ],
        ),
      ),
    );
  }
}

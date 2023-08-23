part of 'widgets.dart';

class AwardContainer extends StatelessWidget {
  const AwardContainer(
      {required this.awardTitle, required this.size, super.key});

  final String awardTitle;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          awardTitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
        ),
      ),
    );
  }
}

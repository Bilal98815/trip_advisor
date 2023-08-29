part of 'widgets.dart';

class TravellersChoiceWidget extends StatelessWidget {
  const TravellersChoiceWidget(
      {required this.size, required this.color, super.key});

  final BoxConstraints size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Assets assets = AssetProvider.of(context).assets;

    return Container(
      width: size.maxWidth * 0.08,
      height: size.maxHeight * 0.06,
      padding: EdgeInsets.only(top: size.maxWidth * 0.01),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            assets.owlLogo,
            width: size.maxWidth * 0.054,
          ),
          Text(
            '2023',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

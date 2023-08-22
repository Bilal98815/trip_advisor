part of 'widgets.dart';

class TravellersChoiceWidget extends StatelessWidget {
  const TravellersChoiceWidget({required this.size, super.key});

  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.maxWidth * 0.08,
      height: size.maxHeight * 0.06,
      padding: EdgeInsets.only(top: size.maxWidth * 0.01),
      decoration: const BoxDecoration(
        color: Color(0xFF3DB489),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/owl.png',
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

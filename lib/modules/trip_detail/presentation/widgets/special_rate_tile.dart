part of 'widgets.dart';

class SpecialRateTile extends StatelessWidget {
  const SpecialRateTile({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Special rate',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
              ),
              Text(
                'Special rate available',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}

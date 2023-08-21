part of 'widgets.dart';

class PasswordRulesRow extends StatelessWidget {
  const PasswordRulesRow({required this.size, required this.rule, super.key});
  final BoxConstraints size;
  final String rule;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: size.maxWidth * 0.03,
          height: size.maxHeight * 0.02,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.tertiary.withOpacity(0.5),
          ),
          child: const Center(child: Icon(Icons.close, size: 8)),
        ),
        SizedBox(
          width: size.maxWidth * 0.02,
        ),
        Text(
          rule,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            color: colorScheme.tertiary.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

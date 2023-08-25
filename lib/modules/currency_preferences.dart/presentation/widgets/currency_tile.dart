part of 'widgets.dart';

class CurrencyTile extends StatelessWidget {
  const CurrencyTile({super.key, required this.currency});

  final Currencies currency;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        context
            .read<PreferencesBloc>()
            .add(PreferencesCurrencyChanged(currency));
        context.pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          '${currency.currency.symbol} ${currency.currency.currency}',
          style: textTheme.bodyMedium,
        ),
      ),
    );
  }
}

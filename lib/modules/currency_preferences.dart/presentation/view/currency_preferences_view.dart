part of 'view.dart';

class CurrencyPreferencesView extends StatelessWidget {
  const CurrencyPreferencesView({super.key});

  static const routeName = 'currency';
  static String route() => '/account/preferences/currency';

  @override
  Widget build(BuildContext context) {
    final List<Currencies> currencies = Currencies.values.toList();

    return Scaffold(
      appBar: CustomAppBar(title: LocaleStrings.currencyTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => CurrencyTile(
            currency: currencies[index],
          ),
          itemCount: currencies.length,
        ),
      ),
    );
  }
}

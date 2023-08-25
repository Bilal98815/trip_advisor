part of 'view.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  static const routeName = 'preferences';
  static String route() => '/account/preferences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  LocaleStrings.preferencesTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 15),
              PreferenceTile(
                title: LocaleStrings.preferencesTileAccountInfo,
                onTap: () => UrlLauncher().launchCustomUrl(
                  Uri.parse('https://www.google.com'),
                ),
              ),
              PreferenceTile(
                title: LocaleStrings.preferencesTileLanguage,
                onTap: () => context.go(LanguagePreferencesView.route()),
                details: context.select(
                  (PreferencesBloc bloc) => bloc.state.language.language.name,
                ),
              ),
              PreferenceTile(
                title: LocaleStrings.preferencesTileCurrency,
                onTap: () => context.go(CurrencyPreferencesView.route()),
                details: context.select(
                  (PreferencesBloc bloc) =>
                      bloc.state.currency.currency.currency,
                ),
              ),
              PreferenceTile(
                title: LocaleStrings.preferencesTileUnits,
                onTap: () {},
              ),
              PreferenceTile(
                title: LocaleStrings.preferencesTilePayment,
                onTap: () => UrlLauncher().launchCustomUrl(
                  Uri.parse('https://www.google.com'),
                ),
              ),
              PreferenceTile(
                title: LocaleStrings.preferencesTileNotifications,
                onTap: () {},
              ),
              PreferenceTile(
                title: LocaleStrings.preferencesTilePrivacy,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

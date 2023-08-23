part of 'view.dart';

class LanguagePreferencesView extends StatelessWidget {
  const LanguagePreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Language> languages = [
      Language(
        name: 'English (United Kingdom)',
        localizedName: LocaleStrings.languageEnglishUK,
        locale: kSupportedLocales[0],
      ),
      Language(
        name: 'English (United States)',
        localizedName: LocaleStrings.languageEnglishUS,
        locale: kSupportedLocales[1],
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Language'),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            _LanguageTile(language: languages[index]),
        itemCount: languages.length,
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({required this.language});

  final Language language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagePreferencesBloc, LanguagePreferencesState>(
      builder: (context, state) {
        return Column(
          children: [
            RadioListTile<String>(
              title: TileTitleText(title: language.name),
              subtitle: TileSubtitleText(subtitle: language.localizedName),
              value: language.locale.toLanguageTag(),
              groupValue: state.selectedLocale.toLanguageTag(),
              onChanged: (value) {
                final Locale locale = value != null
                    ? Locale.fromSubtags(
                        countryCode: value.split('-')[1],
                        languageCode: value.split('-')[0],
                      )
                    : kStartingLocale;

                context.setLocale(locale);

                context
                    .read<LanguagePreferencesBloc>()
                    .add(LanguagePreferencesLocaleChanged(locale));
              },
              activeColor: Theme.of(context).colorScheme.onBackground,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(),
            ),
          ],
        );
      },
    );
  }
}

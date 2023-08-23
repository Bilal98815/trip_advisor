part of 'view.dart';

class LanguagePreferencesView extends StatelessWidget {
  const LanguagePreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Language'),
      body: ListView(
        children: [
          _LanguageTile(
            language: Language(
              name: 'English (United Kingdom)',
              localizedName: LocaleStrings.languageEnglishUK,
              locale: kSupportedLocales[0],
            ),
            onChanged: (value) {},
          ),
          _LanguageTile(
            language: Language(
              name: 'English (United States)',
              localizedName: LocaleStrings.languageEnglishUS,
              locale: kSupportedLocales[1],
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.language,
    required this.onChanged,
  });

  final Language language;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          title: TileTitleText(title: language.name),
          subtitle: TileSubtitleText(subtitle: language.localizedName),
          value:
              '${language.locale.languageCode}_${language.locale.countryCode}',
          groupValue:
              '${kSupportedLocales[0].languageCode}_${kSupportedLocales[0].countryCode}',
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.onBackground,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(),
        ),
      ],
    );
  }
}

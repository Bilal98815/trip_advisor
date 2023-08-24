part of 'view.dart';

class LanguagePreferencesView extends StatelessWidget {
  const LanguagePreferencesView({super.key});

  static const routeName = 'language';
  static String route() => '/account/preferences/language';

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
      appBar: CustomAppBar(title: LocaleStrings.languageTitle),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            LanguageTile(language: languages[index]),
        itemCount: languages.length,
      ),
    );
  }
}

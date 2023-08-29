part of 'view.dart';

class LanguagePreferencesView extends StatelessWidget {
  const LanguagePreferencesView({super.key});

  static const routeName = 'language';
  static String route() => '/account/preferences/language';

  @override
  Widget build(BuildContext context) {
    final List<Languages> languages = Languages.values.toList();

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

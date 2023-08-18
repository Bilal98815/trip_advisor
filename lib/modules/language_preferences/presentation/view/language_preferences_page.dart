part of 'view.dart';

class LanguagePreferencesPage extends StatelessWidget {
  const LanguagePreferencesPage({super.key});

  static const routeName = 'language';
  static String route() => '/account/preferences/language';

  @override
  Widget build(BuildContext context) {
    return const LanguagePreferencesView();
  }
}

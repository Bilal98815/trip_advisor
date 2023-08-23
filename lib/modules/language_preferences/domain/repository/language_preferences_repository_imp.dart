part of 'repository.dart';

class LanguagePreferencesRepositoryImp
    implements LanguagePreferencesRepository {
  LanguagePreferencesRepositoryImp({required this.languagePreferencesAuth});
  late LanguagePreferencesAuth languagePreferencesAuth;

  @override
  Future<void> updateLocale({required String email, required Locale locale}) {
    return languagePreferencesAuth.updateLocale(email: email, locale: locale);
  }
}

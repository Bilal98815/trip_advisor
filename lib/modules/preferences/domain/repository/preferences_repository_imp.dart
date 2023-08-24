part of 'repository.dart';

class PreferencesRepositoryImp implements PreferencesRepository {
  PreferencesRepositoryImp({required this.preferencesAuth});
  late PreferencesAuth preferencesAuth;

  @override
  Future<Locale> getLocale({required String email}) {
    return preferencesAuth.getLocale(email: email);
  }

  @override
  Future<void> updateLocale({required String email, required Locale locale}) {
    return preferencesAuth.updateLocale(email: email, locale: locale);
  }
}

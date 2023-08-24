part of 'repository.dart';

class PreferencesRepositoryImp implements PreferencesRepository {
  PreferencesRepositoryImp({required this.preferencesAPI});
  late PreferencesFirebaseAPI preferencesAPI;

  @override
  Future<Locale> getLocale({required String email}) {
    return preferencesAPI.getLocale(email: email);
  }

  @override
  Future<void> updateLocale({required String email, required Locale locale}) {
    return preferencesAPI.updateLocale(email: email, locale: locale);
  }
}

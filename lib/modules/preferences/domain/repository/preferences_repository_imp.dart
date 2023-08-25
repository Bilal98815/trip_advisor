part of 'repository.dart';

class PreferencesRepositoryImp implements PreferencesRepository {
  PreferencesRepositoryImp({required this.preferencesAPI});
  late PreferencesFirebaseAPI preferencesAPI;

  @override
  Future<PreferenceSettings?> getPreferences({required String email}) {
    return preferencesAPI.getPreferences(email: email);
  }

  @override
  Future<void> updateLanguage({
    required String email,
    required Languages language,
  }) {
    return preferencesAPI.updateLanguage(email: email, language: language);
  }

  @override
  Future<void> updateCurrency({
    required String email,
    required Currencies currency,
  }) {
    return preferencesAPI.updateCurrency(email: email, currency: currency);
  }
}

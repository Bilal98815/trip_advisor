part of 'repository.dart';

class PreferencesRepositoryImp implements PreferencesRepository {
  PreferencesRepositoryImp({required this.preferencesAPI});
  late PreferencesFirebaseAPI preferencesAPI;

  @override
  Future<Language?> getLanguage({required String email}) {
    return preferencesAPI.getLanguage(email: email);
  }

  @override
  Future<void> updateLanguage(
      {required String email, required Language language}) {
    return preferencesAPI.updateLanguage(email: email, language: language);
  }
}

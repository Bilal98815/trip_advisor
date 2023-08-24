part of 'repository.dart';

class PreferencesRepositoryImp implements PreferencesRepository {
  PreferencesRepositoryImp({required this.preferencesAPI});
  late PreferencesFirebaseAPI preferencesAPI;

  @override
  Future<Languages?> getLanguage({required String email}) {
    return preferencesAPI.getLanguage(email: email);
  }

  @override
  Future<void> updateLanguage({
    required String email,
    required Languages language,
  }) {
    return preferencesAPI.updateLanguage(email: email, language: language);
  }
}

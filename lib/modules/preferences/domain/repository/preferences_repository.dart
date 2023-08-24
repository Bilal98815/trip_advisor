part of 'repository.dart';

abstract class PreferencesRepository {
  Future<Languages?> getLanguage({required String email});

  Future<void> updateLanguage({
    required String email,
    required Languages language,
  });
}

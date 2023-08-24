part of 'repository.dart';

abstract class PreferencesRepository {
  Future<Language?> getLanguage({required String email});

  Future<void> updateLanguage({
    required String email,
    required Language language,
  });
}

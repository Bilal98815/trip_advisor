part of 'repository.dart';

abstract class LanguagePreferencesRepository {
  Future<void> updateLocale({required String email, required Locale locale});
}

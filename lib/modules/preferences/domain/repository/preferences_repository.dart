part of 'repository.dart';

abstract class PreferencesRepository {
  Future<Locale> getLocale({required String email});
  Future<void> updateLocale({required String email, required Locale locale});
}

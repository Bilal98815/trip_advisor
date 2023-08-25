part of 'repository.dart';

abstract class PreferencesRepository {
  Future<PreferenceSettings?> getPreferences({required String email});

  Future<void> updateLanguage({
    required String email,
    required Languages language,
  });

  Future<void> updateCurrency({
    required String email,
    required Currencies currency,
  });
}

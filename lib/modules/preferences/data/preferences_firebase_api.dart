part of 'data.dart';

class PreferencesFirebaseAPI {
  Future<PreferenceSettings?> getPreferences({required String email}) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (userDoc.data() != null) {
      final UserModel user = UserModel.fromJson(userDoc.data()!);
      final PreferenceSettings? preferences = user.preferences;
      return preferences;
    }
    return null;
  }

  Future<void> updateLanguage({
    required String email,
    required Languages language,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .update({'preferences.language': language.name});
  }

  Future<void> updateCurrency({
    required String email,
    required Currencies currency,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .update({'preferences.currency': currency.name});
  }

  Future<void> updateUnits({
    required String email,
    required Units units,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .update({'preferences.units': units.name});
  }
}

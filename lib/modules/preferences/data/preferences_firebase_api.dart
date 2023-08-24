part of 'data.dart';

class PreferencesFirebaseAPI {
  Future<Locale> getLocale({required String email}) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (userDoc.data() != null) {
      final UserModel user = UserModel.fromJson(userDoc.data()!);
      final Locale locale = user.preferences?.locale ?? kStartingLocale;
      return locale;
    }
    return kStartingLocale;
  }

  Future<void> updateLocale({
    required String email,
    required Locale locale,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .update({'preferences.locale': locale.toLanguageTag()});
  }
}

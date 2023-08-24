part of 'data.dart';

class PreferencesAuth {
  Future<Locale> getLocale({required String email}) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (userDoc.data() != null) {
      final Locale locale =
          UserModel.fromJson(userDoc.data()!).locale ?? kStartingLocale;
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
        .update({'locale': locale.toLanguageTag()});
  }
}

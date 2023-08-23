part of 'data.dart';

class LanguagePreferencesAuth {
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

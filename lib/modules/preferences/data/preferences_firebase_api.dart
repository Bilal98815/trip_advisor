part of 'data.dart';

class PreferencesFirebaseAPI {
  Future<Language?> getLanguage({required String email}) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (userDoc.data() != null) {
      final UserModel user = UserModel.fromJson(userDoc.data()!);
      final Language? language = user.preferences?.language;
      return language;
    }
    return null;
  }

  Future<void> updateLanguage({
    required String email,
    required Language language,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .update({'preferences.language': language.toJson()});
  }
}

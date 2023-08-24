part of 'data.dart';

class PreferencesFirebaseAPI {
  Future<Languages?> getLanguage({required String email}) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (userDoc.data() != null) {
      final UserModel user = UserModel.fromJson(userDoc.data()!);
      final Languages? language = user.preferences?.language;
      return language;
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
}

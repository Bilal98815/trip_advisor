part of 'data.dart';

class LoginAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final prefs = Preferences();

  Future<void> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    prefs.setUserDetails(email);
  }

  Future<void> updateUser(String token, String email) async {
    debugPrint('------------->>>>>>>> TOKEN: $token');
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'fcm': token,
    });
  }

  Future<UserModel?> getUserDetails(String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userDoc = querySnapshot.docs.first;
        final userData = userDoc.data();
        debugPrint('Retrieved user data: $userData');

        return UserModel.fromJson(userData);
      } else {
        debugPrint('User not found');
        return null;
      }
    } catch (e) {
      debugPrint('Error retrieving user details: $e');
      return null;
    }
  }
}

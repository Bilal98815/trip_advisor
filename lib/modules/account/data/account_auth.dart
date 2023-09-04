part of 'data.dart';

class AccountAuth {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> getUserProfilePicture(String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userDoc = querySnapshot.docs.first;
        final userData = userDoc.data();

        return userData['imageUrl'] as String;
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

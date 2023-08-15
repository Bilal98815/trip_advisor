part of 'data.dart';

class SignupAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserModel user = UserModel(
      email: email,
      name: '',
    );
    await addUserDetails(user);
  }

  Future<void> addUserDetails(UserModel user) async {
    final Timestamp time = Timestamp.fromDate(DateTime.now());
    await FirebaseFirestore.instance.collection('users').doc(user.email).set({
      'email': user.email,
      'country': '',
      'name': '',
      'location': const GeoPoint(0, 0),
      'fcm': '',
      'time': time,
      'bio': '',
      'website': '',
      'imageUrl': '',
    });
  }
}

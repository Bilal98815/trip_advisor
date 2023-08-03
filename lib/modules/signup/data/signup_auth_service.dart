import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/models/user_model.dart';

class SignupAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    UserModel user = UserModel(
      email: email,
      name: '',
    );
    await addUserDetails(user);
  }

  Future addUserDetails(UserModel user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.email).set({
      'email': user.email,
      'country': '',
      'name': '',
      'location': const GeoPoint(0, 0),
    });
  }
}

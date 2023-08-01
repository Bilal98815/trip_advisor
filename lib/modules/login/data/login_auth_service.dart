import 'package:firebase_auth/firebase_auth.dart';

class LoginAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

}
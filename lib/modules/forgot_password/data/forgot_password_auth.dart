import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordAuth {
  Future<void> sendResetPasswordEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

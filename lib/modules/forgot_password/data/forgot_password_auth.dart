part of 'data.dart';

class ForgotPasswordAuth {
  Future sendResetPasswordEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

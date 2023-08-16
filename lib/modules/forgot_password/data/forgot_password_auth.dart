part of 'data.dart';

class ForgotPasswordAuth {
  Future<void> sendResetPasswordEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

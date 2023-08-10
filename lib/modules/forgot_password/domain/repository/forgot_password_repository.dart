abstract class ForgotPasswordRepository {
  Future<void> sendResetPasswordEmail(String email);
}

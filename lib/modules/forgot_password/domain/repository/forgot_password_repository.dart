part of 'repository.dart';

abstract class ForgotPasswordRepository {
  Future<void> sendResetPasswordEmail(String email);
}

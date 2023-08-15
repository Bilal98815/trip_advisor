part of 'repository.dart';

abstract class ForgotPasswordRepository {
  Future sendResetPasswordEmail(String email);
}

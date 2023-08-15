part of 'repository.dart';

class ForgotPasswordRepositoryImp implements ForgotPasswordRepository {
  ForgotPasswordRepositoryImp({required this.forgotPasswordAuth});
  late ForgotPasswordAuth forgotPasswordAuth;

  @override
  Future sendResetPasswordEmail(String email) {
    return forgotPasswordAuth.sendResetPasswordEmail(email);
  }
}

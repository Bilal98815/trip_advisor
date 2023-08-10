import 'package:trip_advisor/modules/forgot_password/data/forgot_password_auth.dart';

import 'package:trip_advisor/modules/forgot_password/domain/repository/forgot_password_repository.dart';

class ForgotPasswordRepositoryImp implements ForgotPasswordRepository {

  ForgotPasswordRepositoryImp({required this.forgotPasswordAuth});
  late ForgotPasswordAuth forgotPasswordAuth;

  @override
  Future sendResetPasswordEmail(String email) {
    return forgotPasswordAuth.sendResetPasswordEmail(email);
  }
}

import 'package:trip_advisor/modules/forgot_password/data/forgot_password_auth.dart';

import 'forgot_password_repository.dart';

class ForgotPasswordRepositoryImp implements ForgotPasswordRepository {
  late ForgotPasswordAuth forgotPasswordAuth;

  ForgotPasswordRepositoryImp({required this.forgotPasswordAuth});

  @override
  Future sendResetPasswordEmail(String email) {
    return forgotPasswordAuth.sendResetPasswordEmail(email);
  }
}

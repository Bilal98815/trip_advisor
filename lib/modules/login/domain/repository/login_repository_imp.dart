import 'package:trip_advisor/common/models/user_model.dart';

import 'package:trip_advisor/modules/login/data/login_auth_service.dart';
import 'package:trip_advisor/modules/login/domain/repository/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {

  LoginRepositoryImp({
    required this.loginAuthService,
  });
  late LoginAuthService loginAuthService;

  @override
  Future<void> signInUser(String email, String password) {
    return loginAuthService.signInUser(email, password);
  }

  @override
  Future updateUser(String token, String email) {
    return loginAuthService.updateUser(token, email);
  }

  @override
  Future<UserModel?> getUserDetails(String email) {
    return loginAuthService.getUserDetails(email);
  }
}

import 'package:trip_advisor/common/models/user_model.dart';

import '../../data/login_auth_service.dart';
import 'login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  late LoginAuthService loginAuthService;

  LoginRepositoryImp({
    required this.loginAuthService,
  });

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

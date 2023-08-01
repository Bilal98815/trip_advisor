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
}

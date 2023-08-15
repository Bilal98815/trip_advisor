part of 'repository.dart';

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

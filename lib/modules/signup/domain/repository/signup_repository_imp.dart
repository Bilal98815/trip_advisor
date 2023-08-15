part of 'repository.dart';

class SignUpRepositoryImp implements SignUpRepository {
  SignUpRepositoryImp({
    required this.signupAuthService,
  });
  late SignupAuthService signupAuthService;

  @override
  Future<void> addUserDetails(UserModel user) {
    return signupAuthService.addUserDetails(user);
  }

  @override
  Future<void> registerUser(String email, String password) {
    return signupAuthService.registerUser(email, password);
  }
}

import 'package:trip_advisor/common/models/user_model.dart';
import 'package:trip_advisor/modules/signup/data/signup_auth_service.dart';
import 'package:trip_advisor/modules/signup/domain/repository/signup_repository.dart';

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

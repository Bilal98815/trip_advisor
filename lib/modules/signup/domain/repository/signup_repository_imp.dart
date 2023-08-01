import 'package:trip_advisor/modules/signup/domain/repository/signup_repository.dart';

import '../../../../common/models/user_model.dart';
import '../../data/signup_auth_service.dart';

class SignUpRepositoryImp implements SignUpRepository {
  late SignupAuthService signupAuthService;

  SignUpRepositoryImp({
    required this.signupAuthService,
  });

  @override
  Future<void> addUserDetails(UserModel user) {
    return signupAuthService.addUserDetails(user);
  }

  @override
  Future<void> registerUser(String email, String password) {
    return signupAuthService.registerUser(email, password);
  }
}

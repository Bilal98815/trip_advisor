import 'package:trip_advisor/common/models/user_model.dart';

abstract class SignUpRepository {
  Future<void> registerUser(String email, String password);
  Future<void> addUserDetails(UserModel user);
}

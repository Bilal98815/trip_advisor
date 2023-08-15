import 'package:trip_advisor/common/models/user_model.dart';

abstract class LoginRepository {
  Future<void> signInUser(String email, String password);
  Future<void> updateUser(String token, String email);
  Future<UserModel?> getUserDetails(String email);
}

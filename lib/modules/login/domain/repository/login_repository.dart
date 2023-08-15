part of 'repository.dart';

abstract class LoginRepository {
  Future<void> signInUser(String email, String password);
  Future updateUser(String token, String email);
  Future<UserModel?> getUserDetails(String email);
}

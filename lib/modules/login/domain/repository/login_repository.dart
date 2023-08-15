part of 'repository.dart';

abstract class LoginRepository {
  Future<void> signInUser(String email, String password);
  Future<void> updateUser(String token, String email);
  Future<UserModel?> getUserDetails(String email);
}

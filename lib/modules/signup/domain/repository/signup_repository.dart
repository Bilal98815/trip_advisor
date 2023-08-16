part of 'repository.dart';

abstract class SignUpRepository {
  Future<void> registerUser(String email, String password);
  Future<void> addUserDetails(UserModel user);
}

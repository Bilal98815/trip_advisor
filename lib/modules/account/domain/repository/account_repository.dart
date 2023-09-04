part of 'repository.dart';

abstract class AccountRepository {
  Future<void> signOut();
  Future<String?> getUserProfilePicture(String email);
}

part of 'repository.dart';

abstract class ProfileRepository {
  Future<UserModel?> getUserDetails(String email);
  Future<void> uploadImagesToFireStore(List<Uint8List> images, String email);
}

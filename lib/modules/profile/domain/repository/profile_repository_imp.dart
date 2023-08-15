part of 'repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({required this.profileAuth});
  late ProfileAuth profileAuth;

  @override
  Future<UserModel?> getUserDetails(String email) {
    return profileAuth.getUserDetails(email);
  }

  @override
  Future<void> uploadImagesToFireStore(List<Uint8List> images, String email) {
    return profileAuth.uploadImagesToFireStore(images, email);
  }
}

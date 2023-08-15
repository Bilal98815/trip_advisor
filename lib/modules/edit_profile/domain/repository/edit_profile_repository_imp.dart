part of 'repository.dart';

class EditProfileRepositoryImp implements EditProfileRepository {
  EditProfileRepositoryImp({required this.editProfileAuth});
  late EditProfileAuth editProfileAuth;

  @override
  Future<void> updateCountry(String country, String email) {
    return editProfileAuth.updateCountry(country, email);
  }

  @override
  Future<void> updateUser({
    String? bio,
    String? name,
    String? website,
    String? email,
    Uint8List? file,
  }) {
    return editProfileAuth.updateUser(
      bio: bio,
      name: name,
      website: website,
      email: email,
      file: file,
    );
  }
}

part of 'repository.dart';

abstract class EditProfileRepository {
  Future<void> updateUser({
    String? bio,
    String? name,
    String? website,
    String? email,
    Uint8List? file,
  });
  Future<void> updateCountry(String country, String email);
}

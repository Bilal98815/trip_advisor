import 'dart:typed_data';

abstract class EditProfileRepository {
  Future updateUser({
    String? bio,
    String? name,
    String? website,
    String? email,
    Uint8List? file,
  });
  Future updateCountry(String country, String email);
}

import 'dart:typed_data';

import 'package:trip_advisor/modules/edit_profile/data/edit_profile_auth.dart';

import 'package:trip_advisor/modules/edit_profile/domain/repository/edit_profile_repository.dart';

class EditProfileRepositoryImp implements EditProfileRepository {

  EditProfileRepositoryImp({required this.editProfileAuth});
  late EditProfileAuth editProfileAuth;

  @override
  Future updateCountry(String country, String email) {
    return editProfileAuth.updateCountry(country, email);
  }

  @override
  Future updateUser(
      {String? bio,
      String? name,
      String? website,
      String? email,
      Uint8List? file,}) {
    return editProfileAuth.updateUser(
      bio: bio,
      name: name,
      website: website,
      email: email,
      file: file,
    );
  }
}

import 'package:trip_advisor/modules/edit_profile/data/edit_profile_auth.dart';

import 'edit_profile_repository.dart';

class EditProfileRepositoryImp implements EditProfileRepository {
  late EditProfileAuth editProfileAuth;

  EditProfileRepositoryImp({required this.editProfileAuth});

  @override
  Future updateUser(String bio, String name, String website, String email) {
    return editProfileAuth.updateUser(bio, name, website, email);
  }

  @override
  Future updateCountry(String country, String email) {
    return editProfileAuth.updateCountry(country, email);
  }
}

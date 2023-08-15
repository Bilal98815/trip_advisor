import 'dart:typed_data';

import 'package:trip_advisor/common/models/user_model.dart';
import 'package:trip_advisor/modules/profile/data/profile_auth.dart';
import 'package:trip_advisor/modules/profile/domain/repository/profile_repository.dart';

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

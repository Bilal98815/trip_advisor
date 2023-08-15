import 'dart:typed_data';

import 'package:trip_advisor/common/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel?> getUserDetails(String email);
  Future<void> uploadImagesToFireStore(List<Uint8List> images, String email);
}

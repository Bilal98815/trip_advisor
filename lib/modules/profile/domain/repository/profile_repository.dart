import 'dart:typed_data';

import '../../../../common/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel?> getUserDetails(String email);
  Future uploadImagesToFireStore(List<Uint8List> images, String email);
}

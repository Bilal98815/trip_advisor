import '../../../../common/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel?> getUserDetails(String email);
}

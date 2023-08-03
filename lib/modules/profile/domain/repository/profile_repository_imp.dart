import 'package:trip_advisor/common/models/user_model.dart';
import 'package:trip_advisor/modules/profile/data/profile_auth.dart';
import 'package:trip_advisor/modules/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  late ProfileAuth profileAuth;

  ProfileRepositoryImp({required this.profileAuth});

  @override
  Future<UserModel?> getUserDetails(String email) {
    return profileAuth.getUserDetails(email);
  }
}

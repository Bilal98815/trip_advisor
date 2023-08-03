import 'package:trip_advisor/modules/profile/data/profile_auth.dart';
import 'package:trip_advisor/modules/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  late ProfileAuth profileAuth;
  ProfileRepositoryImp({required this.profileAuth});

  @override
  Future signOut() {
    return profileAuth.signOut();
  }
}

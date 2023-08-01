import 'package:trip_advisor/modules/user_data/data/user_data_auth.dart';
import 'package:trip_advisor/modules/user_data/domain/repository/user_data_repository.dart';

class UserDataRepositoryImp implements UserDataRepository {
  late UserDataAuth userDataAuth;

  UserDataRepositoryImp({required this.userDataAuth});

  @override
  Future updateStatus(String email, String name) {
    return userDataAuth.updateStatus(email, name);
  }
}

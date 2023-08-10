import 'package:trip_advisor/modules/user_data/data/user_data_auth.dart';
import 'package:trip_advisor/modules/user_data/domain/repository/user_data_repository.dart';

class UserDataRepositoryImp implements UserDataRepository {
  UserDataRepositoryImp({required this.userDataAuth});
  late UserDataAuth userDataAuth;

  @override
  Future<void> updateStatus(String email, String name) {
    return userDataAuth.updateStatus(email, name);
  }

  @override
  Future<void> updateCountry(String email, String country) {
    return userDataAuth.updateCountry(email, country);
  }
}

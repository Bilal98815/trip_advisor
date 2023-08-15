part of 'repository.dart';

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

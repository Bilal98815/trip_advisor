part of 'repository.dart';

class AccountRepositoryImp implements AccountRepository {
  AccountRepositoryImp({required this.accountAuth});
  late AccountAuth accountAuth;

  @override
  Future<void> signOut() {
    return accountAuth.signOut();
  }
}

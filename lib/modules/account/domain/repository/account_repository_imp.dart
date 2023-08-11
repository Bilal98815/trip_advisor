part of 'repository.dart';

class AccountRepositoryImp implements AccountRepository {
  AccountRepositoryImp({required this.accountAuth});
  late AccountAuth accountAuth;

  @override
  Future signOut() {
    return accountAuth.signOut();
  }
}

import 'package:trip_advisor/modules/account/data/account_auth.dart';
import 'package:trip_advisor/modules/account/domain/repository/account_repository.dart';

class AccountRepositoryImp implements AccountRepository {
  AccountRepositoryImp({required this.accountAuth});
  late AccountAuth accountAuth;

  @override
  Future signOut() {
    return accountAuth.signOut();
  }
}

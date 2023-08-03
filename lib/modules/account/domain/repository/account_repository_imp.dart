import 'package:trip_advisor/modules/account/domain/repository/account_repository.dart';

import '../../data/account_auth.dart';

class AccountRepositoryImp implements AccountRepository {
  late AccountAuth accountAuth;
  AccountRepositoryImp({required this.accountAuth});

  @override
  Future signOut() {
    return accountAuth.signOut();
  }
}

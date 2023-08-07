import 'package:equatable/equatable.dart';

import '../../../../common/helpers/enums/enums.dart';

class AccountState extends Equatable {
  @override
  List<Object?> get props => [signOutCondition];

  final SignOutCondition signOutCondition;

  const AccountState({this.signOutCondition = SignOutCondition.signIn});

  AccountState copyWith({SignOutCondition? signOutCondition}) {
    return AccountState(
        signOutCondition: signOutCondition ?? this.signOutCondition);
  }
}

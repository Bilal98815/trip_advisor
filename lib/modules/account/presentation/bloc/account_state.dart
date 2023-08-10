import 'package:equatable/equatable.dart';

import 'package:trip_advisor/common/helpers/enums/enums.dart';

class AccountState extends Equatable {

  const AccountState({this.signOutCondition = SignOutCondition.signIn});
  @override
  List<Object?> get props => [signOutCondition];

  final SignOutCondition signOutCondition;

  AccountState copyWith({SignOutCondition? signOutCondition}) {
    return AccountState(
        signOutCondition: signOutCondition ?? this.signOutCondition,);
  }
}

import 'package:equatable/equatable.dart';

import '../../../../common/helpers/enums/enums.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [signOutCondition];

  final SignOutCondition signOutCondition;

  const ProfileState({this.signOutCondition = SignOutCondition.signIn});

  ProfileState copyWith({SignOutCondition? signOutCondition}) {
    return ProfileState(
        signOutCondition: signOutCondition ?? this.signOutCondition);
  }
}

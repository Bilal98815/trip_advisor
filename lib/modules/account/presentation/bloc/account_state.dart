part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    this.signOutCondition = SignOutCondition.signIn,
    this.image = '',
  });

  @override
  List<Object?> get props => [signOutCondition, image];

  final SignOutCondition signOutCondition;
  final String image;

  AccountState copyWith({SignOutCondition? signOutCondition, String? image}) {
    return AccountState(
      signOutCondition: signOutCondition ?? this.signOutCondition,
      image: image ?? this.image,
    );
  }
}

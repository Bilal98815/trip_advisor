part of 'account_bloc.dart';

abstract class AccountEvent {}

class SignOutEvent extends AccountEvent {}

class GetProfilePicEvent extends AccountEvent {}

class UpdateSigningCondition extends AccountEvent {
  UpdateSigningCondition({required this.condition});
  final SignOutCondition condition;
}

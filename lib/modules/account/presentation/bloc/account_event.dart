import 'package:trip_advisor/common/helpers/enums/enums.dart';

abstract class AccountEvent {}

class SignOutEvent extends AccountEvent {}

class UpdateSigningCondition extends AccountEvent {
  final SignOutCondition condition;

  UpdateSigningCondition({required this.condition});
}

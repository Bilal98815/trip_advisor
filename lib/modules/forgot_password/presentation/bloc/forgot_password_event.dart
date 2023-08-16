part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {}

class ResetPassword extends ForgotPasswordEvent {
  ResetPassword({required this.email});
  final String email;
}

class ShowError extends ForgotPasswordEvent {
  ShowError({required this.error});
  final String error;
}

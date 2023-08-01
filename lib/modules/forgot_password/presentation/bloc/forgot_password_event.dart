abstract class ForgotPasswordEvent {}

class ResetPassword extends ForgotPasswordEvent {
  final String email;

  ResetPassword({required this.email});
}

class ShowError extends ForgotPasswordEvent {
  final String error;

  ShowError({required this.error});
}

part of 'login_bloc.dart';

abstract class LoginEvent {}

class OnLoginEvent extends LoginEvent {
  OnLoginEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

class GetUserDetailsFromDb extends LoginEvent {
  GetUserDetailsFromDb({required this.email});
  final String email;
}

final class LoginErrorUpdated extends LoginEvent {
  LoginErrorUpdated(this.error);
  final String error;
}

class GetUserFromPreferencesEvent extends LoginEvent {}

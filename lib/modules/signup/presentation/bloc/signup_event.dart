part of 'signup_bloc.dart';

abstract class SignupEvent {}

class RegisterEvent extends SignupEvent {
  RegisterEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

class CheckBoxEvent extends SignupEvent {}

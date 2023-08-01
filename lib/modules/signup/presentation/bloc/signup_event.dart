abstract class SignupEvent {}

class RegisterEvent extends SignupEvent {
  final String email;
  final String password;

  RegisterEvent({
    required this.email,
    required this.password,
  });
}

class CheckBoxEvent extends SignupEvent {}

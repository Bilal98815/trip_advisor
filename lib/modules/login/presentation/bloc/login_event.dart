abstract class LoginEvent {}

class OnLoginEvent extends LoginEvent {
  final String email;
  final String password;

  OnLoginEvent({
    required this.email,
    required this.password,
  });
}

class GetUserDetailsFromDb extends LoginEvent {
  final String email;
  GetUserDetailsFromDb({required this.email});
}

class GetUserFromPreferencesEvent extends LoginEvent {}

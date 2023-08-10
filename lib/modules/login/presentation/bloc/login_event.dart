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

class GetUserFromPreferencesEvent extends LoginEvent {}

abstract class UserDataEvent {}

class UpdateNameEvent extends UserDataEvent {
  final String name;
  final String email;
  UpdateNameEvent({required this.name, required this.email});
}

class UpdateCountryEvent extends UserDataEvent {
  final String country;

  UpdateCountryEvent({required this.country});
}

class StoreCountryDB extends UserDataEvent {
  final String country;
  final String email;

  StoreCountryDB({required this.country, required this.email});
}

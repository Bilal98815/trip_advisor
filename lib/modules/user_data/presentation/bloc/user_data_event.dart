abstract class UserDataEvent {}

class UpdateNameEvent extends UserDataEvent {
  UpdateNameEvent({required this.name, required this.email});
  final String name;
  final String email;
}

class UpdateCountryEvent extends UserDataEvent {

  UpdateCountryEvent({required this.country});
  final String country;
}

class StoreCountryDB extends UserDataEvent {

  StoreCountryDB({required this.country, required this.email});
  final String country;
  final String email;
}

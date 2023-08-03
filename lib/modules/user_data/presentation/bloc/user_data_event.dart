abstract class UserDataEvent {}

class UpdateNameEvent extends UserDataEvent {
  final String name;
  UpdateNameEvent({required this.name});
}

class UpdateCountryEvent extends UserDataEvent {
  final String country;

  UpdateCountryEvent({required this.country});
}

class StoreCountryDB extends UserDataEvent {
  final String country;

  StoreCountryDB({required this.country});
}

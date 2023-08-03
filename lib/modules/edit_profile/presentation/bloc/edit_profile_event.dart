abstract class EditProfileEvent {}

class UpdateCountEvent extends EditProfileEvent {
  final int count;

  UpdateCountEvent({required this.count});
}

class UpdateUserEvent extends EditProfileEvent {
  final String bio;
  final String name;
  final String website;

  UpdateUserEvent(
      {required this.bio, required this.name, required this.website});
}

class UpdateCountryEvent extends EditProfileEvent {
  final String country;

  UpdateCountryEvent({required this.country});
}

class StoreCountryDbEvent extends EditProfileEvent {
  final String country;

  StoreCountryDbEvent({required this.country});
}

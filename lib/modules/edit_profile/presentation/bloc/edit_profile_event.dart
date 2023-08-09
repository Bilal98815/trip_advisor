import 'dart:typed_data';

abstract class EditProfileEvent {}

class UpdateCountEvent extends EditProfileEvent {
  final int count;

  UpdateCountEvent({required this.count});
}

class UpdateUserEvent extends EditProfileEvent {
  final String? bio;
  final String? name;
  final String? website;
  final Uint8List? file;

  UpdateUserEvent(
      {required this.bio,
      required this.name,
      required this.website,
      required this.file});
}

class UpdateCountryEvent extends EditProfileEvent {
  final String country;

  UpdateCountryEvent({required this.country});
}

class StoreCountryDbEvent extends EditProfileEvent {
  final String country;

  StoreCountryDbEvent({required this.country});
}

class UpdateImageEvent extends EditProfileEvent {
  final Uint8List img;

  UpdateImageEvent({required this.img});
}

class ShowLoaderEvent extends EditProfileEvent {
  final bool isLoading;

  ShowLoaderEvent({required this.isLoading});
}

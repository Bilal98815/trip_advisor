part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent {}

class UpdateCountEvent extends EditProfileEvent {
  UpdateCountEvent({required this.count});
  final int count;
}

class UpdateUserEvent extends EditProfileEvent {
  UpdateUserEvent({
    required this.bio,
    required this.name,
    required this.website,
    required this.file,
  });
  final String? bio;
  final String? name;
  final String? website;
  final Uint8List? file;
}

class UpdateCountryEvent extends EditProfileEvent {
  UpdateCountryEvent({required this.country});
  final String country;
}

class StoreCountryDbEvent extends EditProfileEvent {
  StoreCountryDbEvent({required this.country});
  final String country;
}

class ShowLoaderEvent extends EditProfileEvent {
  ShowLoaderEvent({required this.isLoading});
  final bool isLoading;
}

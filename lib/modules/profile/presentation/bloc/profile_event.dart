part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetUserEvent extends ProfileEvent {}

class PickImagesEvent extends ProfileEvent {}

class UploadImagesEvent extends ProfileEvent {
  UploadImagesEvent({required this.images});
  final List<Uint8List> images;
}

class DataSavedEvent extends ProfileEvent {
  DataSavedEvent({required this.apiState});
  final ApiState apiState;
}

class UpdateImageEvent extends ProfileEvent {
  UpdateImageEvent({required this.img});
  final Uint8List img;
}

class UpdateImagePathEvent extends ProfileEvent {
  UpdateImagePathEvent({required this.img});
  final String img;
}

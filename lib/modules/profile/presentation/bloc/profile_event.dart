import 'dart:typed_data';

import 'package:trip_advisor/common/helpers/enums/enums.dart';

abstract class ProfileEvent {}

class GetUserEvent extends ProfileEvent {}

class PickImagesEvent extends ProfileEvent {}

class UploadImagesEvent extends ProfileEvent {
  final List<Uint8List> images;
  UploadImagesEvent({required this.images});
}

class DataSavedEvent extends ProfileEvent {
  final ApiState apiState;

  DataSavedEvent({required this.apiState});
}

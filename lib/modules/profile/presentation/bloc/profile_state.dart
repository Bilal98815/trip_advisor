import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/models/user_model.dart';

class ProfileState extends Equatable {

  const ProfileState({this.user, this.apiState = ApiState.idle, this.images});
  @override
  List<Object?> get props => [user, apiState, images];

  final UserModel? user;
  final ApiState apiState;
  final List<Uint8List>? images;

  ProfileState copyWith(
      {UserModel? user, ApiState? apiState, List<Uint8List>? images,}) {
    return ProfileState(
        user: user ?? this.user,
        apiState: apiState ?? this.apiState,
        images: images ?? this.images,);
  }
}

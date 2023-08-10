import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';

class EditProfileState extends Equatable {

  const EditProfileState(
      {this.count = 0,
      this.country = 'Search',
      this.img,
      this.apiState = ApiState.idle,
      this.isLoading = false,});
  @override
  List<Object?> get props => [count, country, img, isLoading, apiState];

  final int count;
  final String country;
  final Uint8List? img;
  final bool isLoading;
  final ApiState apiState;

  EditProfileState copyWith(
      {int? count,
      String? country,
      Uint8List? img,
      ApiState? apiState,
      bool? isLoading,}) {
    return EditProfileState(
        count: count ?? this.count,
        country: country ?? this.country,
        apiState: apiState ?? this.apiState,
        isLoading: isLoading ?? this.isLoading,
        img: img ?? this.img,);
  }
}

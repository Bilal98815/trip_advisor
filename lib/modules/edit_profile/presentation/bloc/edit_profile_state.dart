import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class EditProfileState extends Equatable {
  @override
  List<Object?> get props => [count, country, img, isLoading];

  final int count;
  final String country;
  final Uint8List? img;
  final bool isLoading;

  const EditProfileState(
      {this.count = 0,
      this.country = 'Search',
      this.img,
      this.isLoading = false});

  EditProfileState copyWith(
      {int? count, String? country, Uint8List? img, bool? isLoading}) {
    return EditProfileState(
        count: count ?? this.count,
        country: country ?? this.country,
        isLoading: isLoading ?? this.isLoading,
        img: img ?? this.img);
  }
}

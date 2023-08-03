import 'package:equatable/equatable.dart';

class EditProfileState extends Equatable {
  @override
  List<Object?> get props => [count, country];

  final int count;
  final String country;

  const EditProfileState({this.count = 0, this.country = 'Search'});

  EditProfileState copyWith({int? count, String? country}) {
    return EditProfileState(
        count: count ?? this.count, country: country ?? this.country);
  }
}

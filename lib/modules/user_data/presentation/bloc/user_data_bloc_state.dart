import 'package:equatable/equatable.dart';

class UserDataBlocState extends Equatable {
  const UserDataBlocState({this.name = '', this.country = 'Hometown'});
  @override
  List<Object?> get props => [name, country];

  final String name;
  final String country;

  UserDataBlocState copyWith({String? name, String? country}) {
    return UserDataBlocState(
      name: name ?? this.name,
      country: country ?? this.country,
    );
  }
}

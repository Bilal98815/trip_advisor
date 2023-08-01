import 'package:equatable/equatable.dart';

class UserDataBlocState extends Equatable {
  @override
  List<Object?> get props => [name];

  final String name;

  const UserDataBlocState({this.name = ''});

  UserDataBlocState copyWith({String? name}) {
    return UserDataBlocState(name: name ?? this.name);
  }
}

import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/models/user_model.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [user];

  final UserModel? user;

  const ProfileState({this.user});

  ProfileState copyWith({UserModel? user}) {
    return ProfileState(user: user ?? this.user);
  }
}

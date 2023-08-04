import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/models/user_model.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [user, isLoading];

  final UserModel? user;
  final bool isLoading;

  const ProfileState({this.user, this.isLoading = false});

  ProfileState copyWith({UserModel? user, bool? isLoading}) {
    return ProfileState(
        user: user ?? this.user, isLoading: isLoading ?? this.isLoading);
  }
}

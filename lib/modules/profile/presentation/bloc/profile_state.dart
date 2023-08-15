part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({this.user, this.apiState = ApiState.idle, this.images});
  @override
  List<Object?> get props => [user, apiState, images];

  final UserModel? user;
  final ApiState apiState;
  final List<Uint8List>? images;

  ProfileState copyWith({
    UserModel? user,
    ApiState? apiState,
    List<Uint8List>? images,
  }) {
    return ProfileState(
      user: user ?? this.user,
      apiState: apiState ?? this.apiState,
      images: images ?? this.images,
    );
  }
}

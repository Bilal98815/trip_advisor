part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.user,
    this.apiState = ApiState.idle,
    this.images,
    this.img,
    this.imagePath = '',
  });
  @override
  List<Object?> get props => [user, apiState, images, img, imagePath];

  final UserModel? user;
  final ApiState apiState;
  final Uint8List? img;
  final String? imagePath;
  final List<Uint8List>? images;

  ProfileState copyWith({
    UserModel? user,
    ApiState? apiState,
    Uint8List? img,
    String? imagePath,
    List<Uint8List>? images,
  }) {
    return ProfileState(
      user: user ?? this.user,
      apiState: apiState ?? this.apiState,
      img: img ?? this.img,
      imagePath: imagePath ?? this.imagePath,
      images: images ?? this.images,
    );
  }
}

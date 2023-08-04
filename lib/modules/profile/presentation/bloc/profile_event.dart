abstract class ProfileEvent {}

class GetUserEvent extends ProfileEvent {}

class ShowLoaderEvent extends ProfileEvent {
  final bool isLoader;

  ShowLoaderEvent({required this.isLoader});
}

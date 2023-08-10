abstract class ReviewEvent {}

class IsChangeEvent extends ReviewEvent {

  IsChangeEvent({required this.isChange});
  final bool isChange;
}

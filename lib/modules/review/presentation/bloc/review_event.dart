abstract class ReviewEvent {}

class IsChangeEvent extends ReviewEvent {
  final bool isChange;

  IsChangeEvent({required this.isChange});
}

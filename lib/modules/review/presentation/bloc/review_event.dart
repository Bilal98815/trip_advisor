part of 'review_bloc.dart';

abstract class ReviewEvent {}

class IsChangeEvent extends ReviewEvent {
  IsChangeEvent({required this.isChange});
  final bool isChange;
}

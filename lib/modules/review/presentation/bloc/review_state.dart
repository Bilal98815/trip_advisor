part of 'review_bloc.dart';

class ReviewState extends Equatable {
  const ReviewState({this.isChangeIcon = false});
  @override
  List<Object?> get props => [isChangeIcon];

  final bool isChangeIcon;

  ReviewState copyWith({bool? isChangeIcon}) {
    return ReviewState(isChangeIcon: isChangeIcon ?? this.isChangeIcon);
  }
}

import 'package:equatable/equatable.dart';

class ReviewState extends Equatable {
  @override
  List<Object?> get props => [isChangeIcon];

  final bool isChangeIcon;

  const ReviewState({this.isChangeIcon = false});

  ReviewState copyWith({bool? isChangeIcon}) {
    return ReviewState(isChangeIcon: isChangeIcon ?? this.isChangeIcon);
  }
}

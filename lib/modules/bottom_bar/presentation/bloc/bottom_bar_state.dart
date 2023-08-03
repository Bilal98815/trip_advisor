import 'package:equatable/equatable.dart';

class BottomBarState extends Equatable {
  @override
  List<Object?> get props => [index];

  final int index;

  const BottomBarState({this.index = 0});

  BottomBarState copyWith({int? index}) {
    return BottomBarState(index: index ?? this.index);
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(const ReviewState()) {
    on<IsChangeEvent>((event, emit) {
      changeIcon(event.isChange, emit);
    });
  }

  void changeIcon(bool isChange, Emitter<ReviewState> emit) {
    emit(state.copyWith(isChangeIcon: isChange));
  }
}

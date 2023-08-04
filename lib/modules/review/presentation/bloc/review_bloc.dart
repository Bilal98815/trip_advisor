import 'package:bloc/bloc.dart';
import 'package:trip_advisor/modules/review/presentation/bloc/review_event.dart';
import 'package:trip_advisor/modules/review/presentation/bloc/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(const ReviewState()) {
    on<IsChangeEvent>((event, emit) {
      changeIcon(event.isChange, emit);
    });
  }

  void changeIcon(bool isChange, Emitter emit) {
    emit(state.copyWith(isChangeIcon: isChange));
  }
}

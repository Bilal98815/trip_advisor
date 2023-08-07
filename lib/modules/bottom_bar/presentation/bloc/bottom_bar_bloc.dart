import 'package:bloc/bloc.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/bloc/bottom_bar_event.dart';

import 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(const BottomBarState()) {
    on<BottomBarEvent>((event, emit) {
      updateTabIndex(event.index, emit);
    });
  }

  void updateTabIndex(int index, Emitter emit) {
    emit(state.copyWith(index: index));
  }
}

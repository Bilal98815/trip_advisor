import 'package:bloc/bloc.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/bloc/plan_trip_event.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/bloc/plan_trip_state.dart';

class PlanTripBloc extends Bloc<PlanTripEvent, PlanTripState> {
  PlanTripBloc() : super(const PlanTripState()) {
    on<UpdateTripName>((event, emit) {
      updateTripName(event.tripName, emit);
    });
  }

  void updateTripName(String name, Emitter<PlanTripState> emit) {
    emit(state.copyWith(tripName: name));
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/explore/domain/domain.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc({required this.exploreRepository}) : super(const ExploreState()) {
    on<GetTripsEvent>((event, emit) async {
      await getTrips(emit);
    });
  }

  late ExploreRepository exploreRepository;

  Future<void> getTrips(Emitter<ExploreState> emit) async {
    emit(state.copyWith(apiState: ApiState.loading));
    final trips = await exploreRepository.getTrips();
    final oceanTrips = await exploreRepository.getOceanTrips();
    emit(state.copyWith(
        trips: trips, oceanTrips: oceanTrips, apiState: ApiState.done));
  }
}

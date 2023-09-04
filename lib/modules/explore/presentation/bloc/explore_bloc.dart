import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/explore/domain/domain.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc({required this.exploreRepository, required this.prefs})
      : super(const ExploreState()) {
    on<GetTripsEvent>((event, emit) async {
      await getTrips(emit);
    });
    on<AddToRecentTipsEvent>((event, emit) async {
      await addTripToRecentTrips(event.trip, emit);
    });
  }

  late ExploreRepository exploreRepository;
  late Preferences prefs;

  Future<void> getTrips(Emitter<ExploreState> emit) async {
    final String email = await prefs.getEmail() ?? '';
    emit(state.copyWith(apiState: ApiState.loading));
    final trips = await exploreRepository.getTrips();
    final profilePic = await exploreRepository.getUserProfilePicture(email);
    final oceanTrips = await exploreRepository.getOceanTrips();
    final recentTrips = await exploreRepository.getRecentTrips(email);
    final islandTrips = await exploreRepository.getIslandTrips();
    final mountainTrips = await exploreRepository.getMountainsTrips();
    final naturalWondersTrips =
        await exploreRepository.getNaturalWondersTrips();
    emit(
      state.copyWith(
        trips: trips,
        oceanTrips: oceanTrips,
        islandTrips: islandTrips,
        recentTrips: recentTrips,
        mountainTrips: mountainTrips,
        naturalWondersTrips: naturalWondersTrips,
        image: profilePic,
        apiState: ApiState.done,
      ),
    );
  }

  Future<void> addTripToRecentTrips(
    TripModel trip,
    Emitter<ExploreState> emit,
  ) async {
    final String? email = await prefs.getEmail();
    await exploreRepository.addTripsToRecentTrips(email!, trip);
    final recentTrips = List<TripModel>.from(state.recentTrips);
    recentTrips.add(trip);
    emit(state.copyWith(recentTrips: recentTrips));
  }
}

part of 'explore_bloc.dart';

class ExploreState extends Equatable {
  const ExploreState({
    this.trips = const [],
    this.oceanTrips = const [],
    this.apiState = ApiState.idle,
  });

  @override
  List<Object?> get props => [trips, apiState, oceanTrips];

  final List<TripModel> trips;
  final List<TripModel> oceanTrips;
  final ApiState apiState;

  ExploreState copyWith({
    List<TripModel>? trips,
    ApiState? apiState,
    List<TripModel>? oceanTrips,
  }) {
    return ExploreState(
      trips: trips ?? this.trips,
      apiState: apiState ?? this.apiState,
      oceanTrips: oceanTrips ?? this.oceanTrips,
    );
  }
}

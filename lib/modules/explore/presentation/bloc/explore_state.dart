part of 'explore_bloc.dart';

class ExploreState extends Equatable {
  const ExploreState({
    this.trips = const [],
    this.oceanTrips = const [],
    this.islandTrips = const [],
    this.mountainTrips = const [],
    this.naturalWondersTrips = const [],
    this.recentTrips = const [],
    this.apiState = ApiState.idle,
  });

  @override
  List<Object?> get props => [
        trips,
        apiState,
        oceanTrips,
        islandTrips,
        mountainTrips,
        naturalWondersTrips,
        recentTrips,
      ];

  final List<TripModel> trips;
  final List<TripModel> oceanTrips;
  final List<TripModel> islandTrips;
  final List<TripModel> mountainTrips;
  final List<TripModel> naturalWondersTrips;
  final List<TripModel> recentTrips;
  final ApiState apiState;

  ExploreState copyWith({
    List<TripModel>? trips,
    ApiState? apiState,
    List<TripModel>? oceanTrips,
    List<TripModel>? islandTrips,
    List<TripModel>? naturalWondersTrips,
    List<TripModel>? recentTrips,
    List<TripModel>? mountainTrips,
  }) {
    return ExploreState(
      trips: trips ?? this.trips,
      apiState: apiState ?? this.apiState,
      oceanTrips: oceanTrips ?? this.oceanTrips,
      mountainTrips: mountainTrips ?? this.mountainTrips,
      naturalWondersTrips: naturalWondersTrips ?? this.naturalWondersTrips,
      recentTrips: recentTrips ?? this.recentTrips,
      islandTrips: islandTrips ?? this.islandTrips,
    );
  }
}

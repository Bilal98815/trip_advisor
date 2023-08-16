part of 'plan_trip_bloc.dart';

class PlanTripState extends Equatable {
  const PlanTripState({this.tripName = ''});
  @override
  List<Object?> get props => [tripName];

  final String tripName;

  PlanTripState copyWith({String? tripName}) {
    return PlanTripState(tripName: tripName ?? this.tripName);
  }
}

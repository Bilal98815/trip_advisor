part of 'plan_trip_bloc.dart';

abstract class PlanTripEvent {}

class UpdateTripName extends PlanTripEvent {
  UpdateTripName({required this.tripName});
  final String tripName;
}

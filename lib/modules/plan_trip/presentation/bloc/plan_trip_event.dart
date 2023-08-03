abstract class PlanTripEvent {}

class UpdateTripName extends PlanTripEvent {
  final String tripName;

  UpdateTripName({required this.tripName});
}

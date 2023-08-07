import 'package:equatable/equatable.dart';

class PlanTripState extends Equatable {
  @override
  List<Object?> get props => [tripName];

  final String tripName;

  const PlanTripState({this.tripName = ''});

  PlanTripState copyWith({String? tripName}) {
    return PlanTripState(tripName: tripName ?? this.tripName);
  }
}

part of 'explore_bloc.dart';

abstract class ExploreEvent {}

class GetTripsEvent extends ExploreEvent {}

class AddToRecentTipsEvent extends ExploreEvent {
  AddToRecentTipsEvent({required this.trip});
  final TripModel trip;
}

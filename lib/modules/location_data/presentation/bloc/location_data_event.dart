part of 'location_data_bloc.dart';

class LocationDataEvent {
  LocationDataEvent({required this.location, required this.email});
  final GeoPoint location;
  final String email;
}

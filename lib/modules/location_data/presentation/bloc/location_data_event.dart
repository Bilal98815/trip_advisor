import 'package:cloud_firestore/cloud_firestore.dart';

class LocationDataEvent {
  final GeoPoint location;
  final String email;

  LocationDataEvent({required this.location, required this.email});
}

import 'package:cloud_firestore/cloud_firestore.dart';

class LocationDataEvent {
  LocationDataEvent({required this.location, required this.email});
  final GeoPoint location;
  final String email;
}

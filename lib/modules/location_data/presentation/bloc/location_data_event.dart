import 'package:cloud_firestore/cloud_firestore.dart';

class LocationDataEvent {
  final GeoPoint location;

  LocationDataEvent({required this.location});
}

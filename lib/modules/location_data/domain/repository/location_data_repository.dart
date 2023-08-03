import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LocationDataRepository {
  Future updateLocation(String email, GeoPoint location);
}

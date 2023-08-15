import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LocationDataRepository {
  Future<void> updateLocation(String email, GeoPoint location);
}

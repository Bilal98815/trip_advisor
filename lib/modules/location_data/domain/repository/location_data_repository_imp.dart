import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_advisor/modules/location_data/data/location_data_auth.dart';

import 'location_data_repository.dart';

class LocationDataRepositoryImp implements LocationDataRepository {
  late LocationDataAuth locationDataAuth;

  LocationDataRepositoryImp({required this.locationDataAuth});

  @override
  Future updateLocation(String email, GeoPoint location) {
    return locationDataAuth.updateLocation(email, location);
  }
}

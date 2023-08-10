import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_advisor/modules/location_data/data/location_data_auth.dart';

import 'package:trip_advisor/modules/location_data/domain/repository/location_data_repository.dart';

class LocationDataRepositoryImp implements LocationDataRepository {
  LocationDataRepositoryImp({required this.locationDataAuth});
  late LocationDataAuth locationDataAuth;

  @override
  Future updateLocation(String email, GeoPoint location) {
    return locationDataAuth.updateLocation(email, location);
  }
}

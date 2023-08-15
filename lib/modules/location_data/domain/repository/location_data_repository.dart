part of 'repository.dart';

abstract class LocationDataRepository {
  Future updateLocation(String email, GeoPoint location);
}

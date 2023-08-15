part of 'repository.dart';

abstract class LocationDataRepository {
  Future<void> updateLocation(String email, GeoPoint location);
}

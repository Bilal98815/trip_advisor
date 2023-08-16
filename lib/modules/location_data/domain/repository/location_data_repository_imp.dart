part of 'repository.dart';

class LocationDataRepositoryImp implements LocationDataRepository {
  LocationDataRepositoryImp({required this.locationDataAuth});
  late LocationDataAuth locationDataAuth;

  @override
  Future<void> updateLocation(String email, GeoPoint location) {
    return locationDataAuth.updateLocation(email, location);
  }
}

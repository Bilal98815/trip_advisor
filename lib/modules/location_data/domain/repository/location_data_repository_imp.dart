part of 'repository.dart';

class LocationDataRepositoryImp implements LocationDataRepository {
  LocationDataRepositoryImp({required this.locationDataAuth});
  late LocationDataAuth locationDataAuth;

  @override
  Future updateLocation(String email, GeoPoint location) {
    return locationDataAuth.updateLocation(email, location);
  }
}

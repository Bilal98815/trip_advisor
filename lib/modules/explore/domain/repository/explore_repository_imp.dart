part of 'repository.dart';

class ExploreRepositoryImp implements ExploreRepository {
  ExploreRepositoryImp({required this.exploreAuth});

  late ExploreAuth exploreAuth;

  @override
  Future<List<TripModel>> getTrips() {
    return exploreAuth.getTrips();
  }

  @override
  Future<List<TripModel>> getOceanTrips() {
    return exploreAuth.getOceanTrips();
  }

  @override
  Future<List<TripModel>> getIslandTrips() {
    return exploreAuth.getIslandTrips();
  }

  @override
  Future<List<TripModel>> getMountainsTrips() {
    return exploreAuth.getMountainsTrips();
  }

  @override
  Future<List<TripModel>> getNaturalWondersTrips() {
    return exploreAuth.getNaturalWondersTrips();
  }

  @override
  Future<void> addTripsToRecentTrips(String email, TripModel trip) {
    return exploreAuth.addTripsToRecentTrips(email, trip);
  }

  @override
  Future<List<TripModel>> getRecentTrips(String email) {
    return exploreAuth.getRecentTrips(email);
  }

  @override
  Future<String?> getUserProfilePicture(String email) {
    return exploreAuth.getUserProfilePicture(email);
  }
}

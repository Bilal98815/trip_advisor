part of 'repository.dart';

abstract class ExploreRepository {
  Future<List<TripModel>> getTrips();
  Future<List<TripModel>> getRecentTrips(String email);
  Future<List<TripModel>> getOceanTrips();
  Future<List<TripModel>> getIslandTrips();
  Future<List<TripModel>> getMountainsTrips();
  Future<List<TripModel>> getNaturalWondersTrips();
  Future<void> addTripsToRecentTrips(String email, TripModel trip);
  Future<String?> getUserProfilePicture(String email);
}

part of 'repository.dart';

abstract class ExploreRepository {
  Future<List<TripModel>> getTrips();
  Future<List<TripModel>> getOceanTrips();
}

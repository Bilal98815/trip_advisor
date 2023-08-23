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
}

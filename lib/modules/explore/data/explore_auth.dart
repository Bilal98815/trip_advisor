part of 'data.dart';

class ExploreAuth {
  Future<List<TripModel>> getTrips() async {
    final List<TripModel> trips = [];
    final snapShot = await FirebaseFirestore.instance.collection('trips').get();

    for (final doc in snapShot.docs) {
      final num rating = doc.get('rating') as num;
      final trip = TripModel(
        name: doc.get('name') as String,
        image: doc.get('image') as String,
        rating: rating.toDouble(),
        isAward: doc.get('isAward') as int,
        isTravellersChoice: doc.get('isTravellersChoice') as int,
        description: doc.get('description') as String,
        location: doc.get('location') as String,
      );
      trips.add(trip);
    }
    return trips;
  }

  Future<List<TripModel>> getOceanTrips() async {
    final List<TripModel> trips = [];
    final snapShot =
        await FirebaseFirestore.instance.collection('ocean_trips').get();

    for (final doc in snapShot.docs) {
      final num rating = doc.get('rating') as num;
      final trip = TripModel(
        name: doc.get('name') as String,
        image: doc.get('image') as String,
        rating: rating.toDouble(),
        isAward: doc.get('isAward') as int,
        isTravellersChoice: doc.get('isTravellersChoice') as int,
        description: doc.get('description') as String,
        location: doc.get('location') as String,
      );
      trips.add(trip);
    }
    return trips;
  }
}

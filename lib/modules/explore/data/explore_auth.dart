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

  Future<List<TripModel>> getRecentTrips(String email) async {
    final List<TripModel> trips = [];
    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('recent_trips')
        .get();

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

  Future<List<TripModel>> getNaturalWondersTrips() async {
    final List<TripModel> trips = [];
    final snapShot = await FirebaseFirestore.instance
        .collection('natural_wonders_trips')
        .get();

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

  Future<List<TripModel>> getIslandTrips() async {
    final List<TripModel> trips = [];
    final snapShot =
        await FirebaseFirestore.instance.collection('island_trips').get();

    for (final doc in snapShot.docs) {
      final trip = TripModel(
        name: doc.get('name') as String,
        image: doc.get('image') as String,
        rating: 0.0,
        isAward: 0,
        isTravellersChoice: 0,
        description: '',
        location: '',
      );
      trips.add(trip);
    }
    return trips;
  }

  Future<List<TripModel>> getMountainsTrips() async {
    final List<TripModel> trips = [];
    final snapShot =
        await FirebaseFirestore.instance.collection('mountain_trips').get();

    for (final doc in snapShot.docs) {
      final trip = TripModel(
        name: doc.get('name') as String,
        image: doc.get('image') as String,
        rating: 0.0,
        isAward: 0,
        isTravellersChoice: 0,
        description: '',
        location: '',
      );
      trips.add(trip);
    }
    return trips;
  }

  Future<void> addTripsToRecentTrips(String email, TripModel trip) async {
    final CollectionReference recentTripCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('recent_trips');

    final Map<String, dynamic> recentTrip = trip.toJson();

    await recentTripCollection.add(recentTrip);
  }
}

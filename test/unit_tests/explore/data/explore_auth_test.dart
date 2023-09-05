import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_advisor/common/models/models.dart';
import 'package:trip_advisor/modules/explore/data/data.dart';

void main() {
  group('Initializing testing', () {
    late ExploreAuth exploreAuth;
    late FakeFirebaseFirestore fakeFirebaseFirestore;
    final TripModel fakeTrip = TripModel(
      image: 'image',
      name: 'name',
      location: 'location',
      description: 'description',
      isAward: 0,
      isTravellersChoice: 0,
      rating: 4,
    );

    setUp(() async {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      exploreAuth = ExploreAuth(firestore: fakeFirebaseFirestore);

      await fakeFirebaseFirestore
          .collection('trips')
          .doc('1')
          .set(fakeTrip.toJson());

      await fakeFirebaseFirestore
          .collection('island_trips')
          .doc('1')
          .set(fakeTrip.toJson());
    });

    group('First Group Testing', () {
      test('returns trip', () async {
        final trips = await exploreAuth.getTrips();
        expect(trips, [
          TripModel(
            image: 'image',
            name: 'name',
            location: 'location',
            description: 'description',
            isAward: 0,
            isTravellersChoice: 0,
            rating: 4,
          ),
        ]);
      });
    });

    group('Second group Testing', () {
      test('no trips will be return', () async {
        final mountainTrips = await exploreAuth.getMountainsTrips();
        expect(mountainTrips, <TripModel>[]);
        expect(mountainTrips.length, 0);
      });
    });

    group('Third group Testing', () {
      test('returns number of trips', () async {
        final islandTrips = await exploreAuth.getIslandTrips();
        expect(islandTrips.length, 1);
      });
    });

    group('Fourth Group Testing', () {
      test('Add Trip', () async {
        await exploreAuth.addTripsToRecentTrips(
          'valid.email',
          fakeTrip,
        );
        final trips = await exploreAuth.getRecentTrips('valid.email');
        expect(trips, [
          TripModel(
            image: 'image',
            name: 'name',
            location: 'location',
            isFavourite: false,
            description: 'description',
            isAward: 0,
            isTravellersChoice: 0,
            rating: 4,
          ),
        ]);
      });
    });
  });
}

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

    group('Second Group Testing', () {
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

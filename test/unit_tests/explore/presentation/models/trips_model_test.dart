import 'package:flutter_test/flutter_test.dart';
import 'package:trip_advisor/common/common.dart';

void main() {
  late TripModel tripModel;
  late Map<String, dynamic> jsonExample1;

  setUp(() {
    tripModel = TripModel();
    jsonExample1 = <String, dynamic>{
      'image': 'image',
      'isTravellersChoice': 0,
      'isAward': 1,
      'name': 'VentureDive',
      'rating': 5.0,
      'description': 'In ventureDive',
      'location': 'Lahore',
      'isFavourite': true,
    };
  });

  group('Group testing', () {
    test('Trip model test 1', () {
      expect(tripModel, isA<TripModel>());
    });

    test('toJson test ', () {
      final tripModel2 = TripModel(
        image: 'image',
        location: 'Lahore',
        description: 'In ventureDive',
        isTravellersChoice: 0,
        rating: 5.0,
        name: 'VentureDive',
        isAward: 1,
        isFavourite: true,
      );
      final jsonOutput = tripModel2.toJson();
      expect(jsonOutput, jsonExample1);
    });

    test('fromJson test ', () {
      final tripModel3 = TripModel.fromJson(jsonExample1);
      expect(tripModel3, isA<TripModel>());
    });
  });

  tearDown(() {
    'Trip model test complete';
  });
}

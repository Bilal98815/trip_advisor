import 'package:flutter_test/flutter_test.dart';
import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/explore/presentation/bloc/explore_bloc.dart';

void main() {
  group('Initial group', () {
    late ExploreState exploreState;

    setUp(() {
      exploreState = const ExploreState();
    });

    group('Explore State', () {
      test('copyWith function passes', () {
        final newExploreState = exploreState.copyWith();
        expect(newExploreState, exploreState);
      });
    });

    group('Explore State', () {
      test('copyWith function passes by updating same values', () {
        final newExploreState = exploreState.copyWith(
          image: 'image',
          apiState: ApiState.done,
          trips: [
            TripModel(
              image: 'image',
              name: 'name',
              location: 'location',
              description: 'description',
              isAward: 0,
              isTravellersChoice: 0,
              rating: 4,
            ),
          ],
        );
        expect(
          newExploreState,
          ExploreState(
            image: 'image',
            apiState: ApiState.done,
            trips: [
              TripModel(
                image: 'image',
                name: 'name',
                location: 'location',
                description: 'description',
                isAward: 0,
                isTravellersChoice: 0,
                rating: 4,
              ),
            ],
          ),
        );
      });
    });

    group('Explore State', () {
      test('copyWith function passes by giving different values', () {
        final newExploreState = exploreState.copyWith(
          image: 'https//image.jpg',
          apiState: ApiState.loading,
        );
        expect(
          newExploreState,
          isNot(
            const ExploreState(
              image: 'image',
              apiState: ApiState.done,
            ),
          ),
        );
      });
    });
  });
}

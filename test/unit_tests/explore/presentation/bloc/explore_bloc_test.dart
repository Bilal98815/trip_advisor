import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/explore/domain/repository/repository.dart';
import 'package:trip_advisor/modules/explore/presentation/bloc/explore_bloc.dart';

class MockExploreRepository extends Mock implements ExploreRepositoryImp {}

class MockPreferences extends Mock implements Preferences {}

List<TripModel> mockTrips = [];
TripModel fakeTrip = TripModel(
  image: 'image',
  name: 'name',
  location: 'location',
  description: 'description',
  isFavourite: true,
  isAward: 0,
  isTravellersChoice: 0,
  rating: 4,
);

void main() {
  group('Second Group testing', () {
    late ExploreBloc exploreBloc;
    late MockExploreRepository mockExploreRepository;
    late MockPreferences mockPreferences;

    setUp(() {
      mockExploreRepository = MockExploreRepository();
      mockPreferences = MockPreferences();
      exploreBloc = ExploreBloc(
        exploreRepository: mockExploreRepository,
        prefs: mockPreferences,
      );
    });

    tearDown(() {
      exploreBloc.close();
    });

    group('State testing', () {
      test('State testing correctly', () {
        expect(
          const ExploreState(),
          exploreBloc.state,
        );
      });
    });

    Future<void> arrangeSharedPreferenceEmail() async {
      when(() => mockPreferences.getEmail())
          .thenAnswer((_) async => 'valid.email');
    }

    Future<void> arrangeRepositoryReturnAllTrips() async {
      when(() => mockExploreRepository.getTrips()).thenAnswer(
        (inv) async => mockTrips,
      );
    }

    Future<void> arrangeRepositoryReturnRecentTrips() async {
      when(() => mockExploreRepository.getRecentTrips('valid.email'))
          .thenAnswer(
        (inv) async => mockTrips,
      );
    }

    Future<void> arrangeRepositoryReturnMountainTrips() async {
      when(() => mockExploreRepository.getMountainsTrips()).thenAnswer(
        (inv) async => mockTrips,
      );
    }

    Future<void> arrangeRepositoryReturnIslandTrips() async {
      when(() => mockExploreRepository.getIslandTrips())
          .thenAnswer((inv) async => mockTrips);
    }

    Future<void> arrangeRepositoryReturnOceanTrips() async {
      when(() => mockExploreRepository.getOceanTrips()).thenAnswer(
        (inv) async => mockTrips,
      );
    }

    Future<void> arrangeRepositoryReturnNaturalWondersTrips() async {
      when(() => mockExploreRepository.getNaturalWondersTrips()).thenAnswer(
        (inv) async => mockTrips,
      );
    }

    Future<void> addToTrip() async {
      when(
        () => mockExploreRepository.addTripsToRecentTrips(
          'valid.email',
          fakeTrip,
        ),
      ).thenAnswer(
        (inv) async => mockTrips,
      );
    }

    group('Bloc testing 1', () {
      blocTest<ExploreBloc, ExploreState>(
        'Getting All trips test',
        setUp: () {
          arrangeSharedPreferenceEmail();
          arrangeRepositoryReturnAllTrips();
          arrangeRepositoryReturnRecentTrips();
          arrangeRepositoryReturnMountainTrips();
          arrangeRepositoryReturnNaturalWondersTrips();
          arrangeRepositoryReturnIslandTrips();
          arrangeRepositoryReturnOceanTrips();
        },
        build: () => exploreBloc,
        act: (bloc) => bloc.add(GetTripsEvent()),
        expect: () => [
          const ExploreState(
            apiState: ApiState.loading,
          ),
          const ExploreState(
            apiState: ApiState.done,
          ),
        ],
      );
    });

    group('Bloc testing 2', () {
      blocTest<ExploreBloc, ExploreState>(
        'Getting trips test',
        setUp: () {
          arrangeSharedPreferenceEmail();
          addToTrip();
        },
        build: () => exploreBloc,
        act: (bloc) => bloc.add(AddToRecentTipsEvent(trip: fakeTrip)),
        expect: () => [
          ExploreState(
            recentTrips: [
              TripModel(
                image: 'image',
                name: 'name',
                location: 'location',
                description: 'description',
                isFavourite: true,
                isAward: 0,
                isTravellersChoice: 0,
                rating: 4,
              )
            ],
          ),
        ],
      );
    });
  });
}

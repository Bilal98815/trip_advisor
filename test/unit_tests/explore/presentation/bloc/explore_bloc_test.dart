import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/explore/domain/repository/repository.dart';
import 'package:trip_advisor/modules/explore/presentation/bloc/explore_bloc.dart';

class MockExploreRepository extends Mock implements ExploreRepository {}

class MockPreferences extends Mock implements Preferences {}

List<TripModel> mockTrips = [];

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
      when(() => mockExploreRepository.getIslandTrips()).thenAnswer(
        (inv) async => mockTrips,
      );
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

    group('Bloc testing', () {
      blocTest<ExploreBloc, ExploreState>(
        'Getting trips test',
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
  });
}

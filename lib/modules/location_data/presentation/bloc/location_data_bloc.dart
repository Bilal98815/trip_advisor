import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';

import 'package:trip_advisor/modules/location_data/domain/repository/location_data_repository.dart';
import 'package:trip_advisor/modules/location_data/presentation/bloc/location_data_event.dart';
import 'package:trip_advisor/modules/location_data/presentation/bloc/location_data_state.dart';

class LocationDataBloc extends Bloc<LocationDataEvent, LocationDataState> {

  LocationDataBloc({required this.locationDataRepository})
      : super(const LocationDataState()) {
    on<LocationDataEvent>((event, emit) async {
      await updateLocation(event.location, event.email);
    });
  }
  late LocationDataRepository locationDataRepository;

  final prefs = Preferences();

  Future updateLocation(GeoPoint location, String email) async {
    await locationDataRepository.updateLocation(email, location);
  }
}

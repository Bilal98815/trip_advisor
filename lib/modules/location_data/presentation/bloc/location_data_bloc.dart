import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';

import '../../domain/repository/location_data_repository.dart';
import 'location_data_event.dart';
import 'location_data_state.dart';

class LocationDataBloc extends Bloc<LocationDataEvent, LocationDataState> {
  late LocationDataRepository locationDataRepository;

  LocationDataBloc({required this.locationDataRepository})
      : super(const LocationDataState()) {
    on<LocationDataEvent>((event, emit) async {
      await updateLocation(event.location, event.email);
    });
  }

  final prefs = Preferences();

  Future updateLocation(GeoPoint location, String email) async {
    await locationDataRepository.updateLocation(email, location);
  }
}

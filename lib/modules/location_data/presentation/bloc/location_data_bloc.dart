import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:trip_advisor/common/helpers/helpers.dart';
import 'package:trip_advisor/modules/location_data/location_data.dart';

part 'location_data_event.dart';
part 'location_data_state.dart';

class LocationDataBloc extends Bloc<LocationDataEvent, LocationDataState> {
  LocationDataBloc({required this.locationDataRepository})
      : super(const LocationDataState()) {
    on<LocationDataEvent>((event, emit) async {
      await updateLocation(event.location, event.email);
    });
  }
  late LocationDataRepository locationDataRepository;

  final prefs = Preferences();

  Future<void> updateLocation(GeoPoint location, String email) async {
    await locationDataRepository.updateLocation(email, location);
  }
}

part of 'location_data_bloc.dart';

class LocationDataState extends Equatable {
  const LocationDataState({this.location = const GeoPoint(0, 0)});
  @override
  List<Object?> get props => [location];

  final GeoPoint location;

  LocationDataState copyWith({GeoPoint? location}) {
    return LocationDataState(location: location ?? this.location);
  }
}
